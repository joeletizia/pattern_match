class PatternGrader
  def initialize(path)
    @path = path.split("/")
  end

  def best(matches)
    return nil if matches.empty?

    best_match = matches.first

    matches.each do |match|
      if number_of_wild_cards(match) < number_of_wild_cards(best_match)
        best_match = match
        next
      end

      if index_of_first_wildcard(match) > index_of_first_wildcard(best_match)
        best_match = match
      end
    end

    best_match
  end

  private

  attr_reader :path

  def number_of_wild_cards(pattern)
    pattern.split(',').inject(0) do |total_wildcards, char|
      if char == '*'
        total_wildcards + 1
      else
        total_wildcards
      end
    end
  end

  def index_of_first_wildcard(pattern)
    pattern.split(',').index("*") || -1
  end
end
