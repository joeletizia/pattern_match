class PathSanitizer
  def initialize(paths)
    @paths = paths
  end

  def sanitize
    paths.map do |path|
      new_path = remove_leading_slashes(path)
      remove_trailing_slashes(new_path)
    end
  end

  private

  attr_reader :paths

  def remove_leading_slashes(path)
    path.gsub(/^\//, "")
  end

  def remove_trailing_slashes(path)
    path.gsub(/\/$/, "")
  end
end
