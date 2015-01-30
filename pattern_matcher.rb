class PatternMatcher
  WILDCARD = '*'

  def initialize(path)
    @path = path.split("/")
  end

  def match?(pattern)
    pattern = pattern.split(",")
    return false if segment_count_mismatch(pattern)

    (0...pattern.length).each do |index|
      return false unless Comparator.new(pattern[index]).path_match?(path[index])
    end

    true
  end

  private

  def segment_count_mismatch(pattern)
    path.length != pattern.length
  end

  attr_reader :path

  class Comparator
    def initialize(pattern_segment) 
      @pattern_segment = pattern_segment
    end

    def path_match?(path_segment)
      pattern_segment == WILDCARD ||
        path_segment == pattern_segment
    end

    private

    attr_reader :pattern_segment
  end
end
