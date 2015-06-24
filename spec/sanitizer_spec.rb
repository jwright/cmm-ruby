require "./lib/sanitizer"

describe Sanitizer do
  let(:text) { "This is some unsanitized text" }
  subject { Sanitizer.new(text) }

  it "returns the same text if it has not been sanitized" do
    expect(subject.sanitized_text).to eq text
  end

  describe "#sanitize" do
    let(:rule) { double(:sanitation_rule, sanitize: text) }

    it "runs the sanitation rules that are specified" do
      expect(rule).to receive(:sanitize).with(text).and_return(subject)
      subject.sanitize(rule)
    end
  end

  describe "#unsanitize" do
    let(:rule) { double(:sanitation_rule, sanitize: text, unsanitize: text) }

    it "runs the same sanitation rules when the text was sanitized" do
      subject.sanitize(rule)
      expect(rule).to receive(:unsanitize).with(text).and_return(subject)
      subject.unsanitize
    end

    it "can unsanitize different text" do
      words = "This is some different unsanizied text"
      subject.sanitize(rule)
      expect(rule).to receive(:unsanitize).with(words).and_return(subject)
      subject.unsanitize(words)
    end
  end
end
