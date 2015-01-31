require 'spec_helper'
require_relative '../path_sanitizer'

describe PathSanitizer do
  subject(:sanitizer) { PathSanitizer.new(paths) }

  describe "#sanitize" do
    let(:paths) { ["/w/x/y/z/"] }
      
    it "removes root and trailing slashes" do
      sanitized_paths = ["w/x/y/z"]
      expect(sanitizer.sanitize).to eq(sanitized_paths)
    end
  end
end
