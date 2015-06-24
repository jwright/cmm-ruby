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

  xit "ignores whitespace"
  xit "ignores puncuation"
  xit "ignores quotes"
  xit "handles contractions"
end
