class Sanitizer
  attr_reader :sanitized_text, :text
  attr_accessor :rules

  def initialize(text)
    @text = text
    @sanitized_text = text
    @rules = []
  end

  def sanitize(*rules)
    self.rules = *rules
    self.rules.map { |rule| @sanitized_text = rule.sanitize(sanitized_text) }
    self
  end

  def unsanitize(unsanitized_text=sanitized_text)
    @sanitized_text = unsanitized_text
    self.rules.reverse.map { |rule| @sanitized_text = rule.unsanitize(sanitized_text) }
    self
  end
end
