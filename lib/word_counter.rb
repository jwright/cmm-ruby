class WordCounter
  attr_reader :results, :text

  def initialize(text)
    @text = text
    @results = {}
  end

  def count_words
    result_array = []

    words = text.scan(/\b(\w+)\b/).flatten

    words.to_a.each do |word|
      result_array << [word, 1]
    end

    results = Hash[*result_array.flatten]
  end
end
