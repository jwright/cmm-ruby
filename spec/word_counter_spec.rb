require "./lib/word_counter"

describe WordCounter do
  it "counts the occurances of a word" do
    text = "Hello"
    count = WordCounter.new(text).count_words
    expect(count["Hello"]).to eq 1
  end

  it "counts the occurances of 2 words" do
    text = "Hello World"
    count = WordCounter.new(text).count_words
    expect(count["Hello"]).to eq 1
    expect(count["World"]).to eq 1
  end
end
