# Pattern Matching

In order to run the pattern matching utility, please do the following:

* `bundle`
* `cat input_file.txt | ruby pattern_matching.rb`

The utility expects input that is formatted similarly to the below:

    6 => the number of patterns below
    *,b,*
    a,*,*
    *,*,c
    foo,bar,baz
    w,x,*,*
    *,x,y,z
    5 => the number of paths to check against the patterns
    /w/x/y/z/
    a/b/c
    foo/
    foo/bar/
    foo/bar/baz/

For each path, the utility will return the best match, or an indicator that there was no match. 

The criteria for a match are as follows:

1. The number of segments. If a path with y segments is tested against a pattern with n segments where y != n, the pattern is a non-match.
2. Definitive segments. For a path with a definitive (non-wildcard) segment, if the segment at index n for the pattern does not match the segment at index n for the path, the pattern is a non match. 
3. Wildcard count. If two patterns are a match for a path, the pattern with less wildcards is a better match.
4. Wildcard placement. If two patterns are a match for a path, the pattern with any wildcards occuring later than another pattern is a better match.

As an example, the below is an example of proper input and output:

### Example Input 

    6
    *,b,*
    a,*,*
    *,*,c
    foo,bar,baz
    w,x,*,*
    *,x,y,z
    5
    /w/x/y/z/
    a/b/c
    foo/
    foo/bar/
    foo/bar/baz/

### Example Output

    *,x,y,z
    a,*,*
    NO MATCH
    NO MATCH
    foo,bar,baz


## Analysis of Solution

There are two variables at play, the number of patterns k and the number of paths n. The runtime of the program in the worst case is O(nk) because each path must be compared to each pattern. This gives a number of comparisons, however, in the given implementation, there are ways for the routines to short circuit and save compute cycles by failing early. For example, if a path and a pattern have a differing number of segments, no other comparisons are made. This increases performance because there is no need for a full traversal against paths and patterns that have absolutely no chance of qualifying as a match.
