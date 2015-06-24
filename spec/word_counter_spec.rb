require "./lib/word_counter"

describe WordCounter do
  it "counts the occurances of a word" do
    text = "Hello"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 1
  end

  it "counts the occurances of 2 words" do
    text = "Hello World"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 1
    expect(count["world"]).to eq 1
  end

  it "counts multiple occurances of the same word" do
    text = "Hello Hello"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 2
  end

  it "is case insensitive" do
    text = "Hello heLLo"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 2
  end

  it "ignores whitespace" do
    text = "Hello          hello"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 2
    expect(count[" "]).to be_nil
  end

  it "ignores puncuation" do
    text = "Hello. World! We,are here."
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 1
    expect(count["world"]).to eq 1
    expect(count["we"]).to eq 1
    expect(count["are"]).to eq 1
    expect(count["here"]).to eq 1
    expect(count["."]).to be_nil
    expect(count["!"]).to be_nil
    expect(count[","]).to be_nil
  end

  xit "ignores quotes"
  xit "handles contractions"
end
