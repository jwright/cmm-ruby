class WordCounter
  attr_reader :results, :text

  def initialize(text)
    @text = text
    @results = {}
  end

  def count_words
    words = text.scan(/\b(\w+)\b/).flatten

    words.to_a.each do |word|
      if results.key?(word)
        results[word] += 1
      else
        results[word] = 1
      end
    end

    results
  end
end
