require 'spec_helper'
require_relative '../pattern_matcher'

describe PatternMatcher do
  subject(:matcher) { PatternMatcher.new(path)}

  describe "#match?" do
    let(:path) { 'a/b/c' }

    before do
      stub_const("SegmentCounter", double(:thing))
    end

    context "when the given pattern does not have the same number of segments as the path" do
      let(:pattern) { '*,*' }

      it "returns false" do
        expect(matcher.match?(pattern)).to eq(false)
      end
    end

    context "when the given pattern has the same number of segments as the path" do
      context "when the given pattern matches the path" do
        let(:pattern) { '*,*,*' }

        it "returns true" do
          expect(matcher.match?(pattern)).to eq(true)
        end
      end

      context "when the given pattern does not match the path" do
        let(:pattern) { 'x,*,*' }
        it "returns false" do
          expect(matcher.match?(pattern)).to eq(false)
        end
      end

    end
  end
end
