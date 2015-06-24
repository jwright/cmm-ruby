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
    text = "Hello. World! We,are here?"
    count = WordCounter.new(text).count_words
    expect(count["hello"]).to eq 1
    expect(count["world"]).to eq 1
    expect(count["we"]).to eq 1
    expect(count["are"]).to eq 1
    expect(count["here"]).to eq 1
    expect(count["."]).to be_nil
    expect(count["!"]).to be_nil
    expect(count[","]).to be_nil
    expect(count["?"]).to be_nil
  end

  it "ignores quotes" do
    text = "We are \"here\" yo."
    count = WordCounter.new(text).count_words
    expect(count["here"]).to eq 1
    expect(count["yo"]).to eq 1
    expect(count["\""]).to be_nil
  end

  it "handles contractions" do
    text = "Why don't you live here?"
    count = WordCounter.new(text).count_words
    expect(count["don't"]).to eq 1
  end

  it "handles numbers" do
    text = "There were 500 worlds"
    count = WordCounter.new(text).count_words
    expect(count["500"]).to eq 1
  end

  it "handles time" do
    text = "It's about 3:16 p.m."
    count = WordCounter.new(text).count_words
    expect(count["3:16"]).to eq 1
  end

  it "handles time period specification" do
    text = "It's about 3:16 p.m."
    count = WordCounter.new(text).count_words
    expect(count["p.m."]).to eq 1
  end

  describe "sorting" do
    it "sorts the results by word count" do
      text = "Hello World. World."
      count = WordCounter.new(text).count_words
      expect(count.keys[0]).to eq "world"
    end

    it "sorts the results alphabetically if they appear the same amount" do
      text = "Hello Boss"
      count = WordCounter.new(text).count_words
      expect(count.keys[0]).to eq "boss"
    end
  end
end
