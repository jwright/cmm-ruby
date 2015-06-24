require_relative "sanitizer"
require_relative "contraction_sanitizer_rule"
require_relative "time_sanitizer_rule"
require_relative "time_period_sanitizer_rule"

class WordCounter
  attr_reader :results, :sanitizer, :text

  def initialize(text, sanitizer=Sanitizer.new(text))
    @text = text
    @results = {}
    @sanitizer = sanitizer
  end

  def count_words
    sanitized_text = sanitizer.sanitize(ContractionSanitizerRule.new,
                                        TimeSanitizerRule.new,
                                        TimePeriodSanitizerRule.new).sanitized_text

    words = sanitized_text.scan(/\b(\w+)\b/).flatten

    words.to_a.each do |word|
      insensitive_word = sanitizer.unsanitize(word.downcase).sanitized_text

      if results.key?(insensitive_word)
        results[insensitive_word] += 1
      else
        results[insensitive_word] = 1
      end
    end

    results
  end
end
