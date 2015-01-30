require 'spec_helper'

describe "Pattern Matching" do
  it "returns matching patterns" do
    output = `cat spec/test_input.txt | ruby pattern_matching.rb`
    expect(output).to eq("*,b,*")
  end
end
