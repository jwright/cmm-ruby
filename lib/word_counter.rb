class WordCounter
  attr_reader :results, :text

  def initialize(text)
    @text = text
    @results = {}
  end

  def count_words
    sanitized_text = sanitize_contractions(text)
    sanitized_text = sanitize_time(sanitized_text)

    words = sanitized_text.scan(/\b(\w+)\b/).flatten

    words.to_a.each do |word|
      insensitive_word = unsanitize_contractions word.downcase
      insensitive_word = unsanitize_time insensitive_word

      if results.key?(insensitive_word)
        results[insensitive_word] += 1
      else
        results[insensitive_word] = 1
      end
    end

    results
  end

  def sanitize_contractions(words)
    words.gsub /'(?=(d|ll|m|re|s|t|ve))/, "__c__"
  end

  def sanitize_time(words)
    words.gsub /(?<=[\d{1,2}]):(?=[\d{1,2}])/, "__ts__"
  end

  def unsanitize_contractions(words)
    words.gsub /__c__/, "'"
  end

  def unsanitize_time(words)
    words.gsub /__ts__/, ":"
  end
end
