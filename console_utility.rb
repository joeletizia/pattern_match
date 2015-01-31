class ConsoleUtility

  NO_MATCH_FOUND_INDICATOR = "NO MATCH"

  def initialize(std_input)
    @std_input = std_input
  end

  def number_of_patterns
    std_input[0].to_i
  end

  def patterns
    std_input[1..number_of_patterns].map(&:chomp)
  end

  def number_of_paths
    std_input[number_of_patterns+1].to_i
  end

  def paths
    paths = std_input[number_of_patterns+2...std_input.length].map(&:chomp)
    PathSanitizer.new(paths).sanitize
  end

  private

  attr_reader :std_input
end

