require 'pry'
require_relative './pattern_matcher'
require_relative './pattern_grader'

Readline.input = IO.new(IO.sysopen("/dev/tty", "r+"))

input = STDIN.readlines

number_of_patterns = input[0].to_i
patterns = input[1..number_of_patterns].map(&:chomp)
number_of_paths = input[number_of_patterns+1].to_i
paths = input[number_of_patterns+2...input.length].map(&:chomp)

paths.each do |path|
  matcher = PatternMatcher.new(path)

  matches = []

  patterns.each do |pattern|
    matches << pattern if matcher.match?(pattern)
  end

  if matches.any?
    puts PatternGrader.new(path).best(matches)
  else
    puts "NO MATCH"
  end
end
