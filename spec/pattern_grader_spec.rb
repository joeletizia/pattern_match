require 'spec_helper'
require_relative '../pattern_grader'

describe PatternGrader do
  subject(:grader) { PatternGrader.new(path) }
  let(:path) { '/path/to/thing' }

  describe "#best" do
    context "when the given array is empty" do
      let(:matches) { [] }
      it "returns nil" do
        expect(grader.best(matches)).to eq(nil)
      end
    end

    context "when the given array is not nil" do
      let(:matches) { [match, best_match] }

      context "when there is a difference in the number of wildcards between matches" do
        let(:match) { ',path,*,thing' }
        let(:best_match) { ',path,to,thing' }

        it "returns the pattern with less wildcards" do
          expect(grader.best(matches)).to eq(best_match)
        end
      end

      context "when there is an equal number of wildcards" do
        let(:match) { ',path,*,thing' }
        let(:best_match) { ',path,to,*' }

        it "returns the pattern most clearly defined from the left" do
          expect(grader.best(matches)).to eq(best_match)
        end
      end
    end
  end
end

