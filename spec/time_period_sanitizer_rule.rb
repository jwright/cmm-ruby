require "./lib/sanitizer_rules/time_period_sanitizer_rule"

describe TimePeriodSanitizerRule do
  subject { TimePeriodSanitizerRule.new }

  describe "#sanitize" do
    it "returns a word boundry safe replacement for a time period" do
      actual = subject.sanitize "It is 12:45 a.m."
      expect(actual).to eq "It is 12:45 __am__"
    end
  end

  describe "#unsanitize" do
    it "returns the original time period from a word boundry safe replacement" do
      actual = subject.unsanitize "It is 12:45 __am__"
      expect(actual).to eq "It is 12:45 a.m."
    end
  end
end
