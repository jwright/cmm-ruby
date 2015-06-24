class WordCounter
  attr_reader :results, :text

  def initialize(text)
    @text = text
    @results = {}
  end

  def count_words
    words = text.scan(/\b(\w+)\b/).flatten

    words.to_a.each do |word|
      insensitive_word = word.downcase

      if results.key?(insensitive_word)
        results[insensitive_word] += 1
      else
        results[insensitive_word] = 1
      end
    end

    results
  end
end
