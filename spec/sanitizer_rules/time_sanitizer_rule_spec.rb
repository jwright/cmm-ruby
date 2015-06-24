require "./lib/sanitizer_rules/time_sanitizer_rule"

describe TimeSanitizerRule do
  subject { TimeSanitizerRule.new }

  describe "#sanitize" do
    it "returns a word boundry safe replacement for a time" do
      actual = subject.sanitize "It is 12:45"
      expect(actual).to eq "It is 12__ts__45"
    end
  end

  describe "#unsanitize" do
    it "returns the original time from a word boundry safe replacement" do
      actual = subject.unsanitize "It is 12__ts__45"
      expect(actual).to eq "It is 12:45"
    end
  end
end
