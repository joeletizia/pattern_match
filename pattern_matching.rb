require_relative './pattern_matcher'
require_relative './pattern_grader'
require_relative './path_sanitizer'
require_relative './console_utility'

input = STDIN.readlines

console_utility = ConsoleUtility.new(input)

console_utility.paths.each do |path|
  matcher = PatternMatcher.new(path)

  matches = []

  console_utility.patterns.each do |pattern|
    matches << pattern if matcher.match?(pattern)
  end

  console_output = matches.any? ? PatternGrader.new(path).best(matches) : ConsoleUtility::NO_MATCH_FOUND_INDICATOR

  puts console_output
end
