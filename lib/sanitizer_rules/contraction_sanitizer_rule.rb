class ContractionSanitizerRule
  def initialize
    @replacement = "__c__".freeze
  end

  def sanitize(text)
    text.gsub /'(?=(d|ll|m|re|s|t|ve))/, replacement
  end

  def unsanitize(text)
    text.gsub replacement, "'"
  end

  private

  def replacement
    @replacement
  end
end
