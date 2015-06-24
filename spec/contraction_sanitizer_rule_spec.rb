require "./lib/contraction_sanitizer_rule"

describe ContractionSanitizerRule do
  subject { ContractionSanitizerRule.new }

  describe "#sanitize" do
    it "returns a word boundry safe replacement for a contraction" do
      actual = subject.sanitize "You don't live here"
      expect(actual).to eq "You don__c__t live here"
    end
  end

  describe "#unsanitize" do
    it "returns the original contraction from a word boundry safe replacement" do
      actual = subject.unsanitize "You don__c__t live here"
      expect(actual).to eq "You don't live here"
    end
  end
end
