require "./lib/sanitizer"

describe Sanitizer do
  let(:text) { "This is some unsanitized text" }
  subject { Sanitizer.new(text) }

  it "returns the same text if it has not been sanitized" do
    expect(subject.sanitized_text).to eq text
  end
end
