class TimeSanitizerRule
  def initialize
    @replacement = "__ts__".freeze
  end

  def sanitize(text)
    text.gsub /(?<=[\d{1,2}]):(?=[\d{1,2}])/, replacement
  end

  def unsanitize(text)
    text.gsub replacement, ":"
  end

  private

  def replacement
    @replacement
  end
end
