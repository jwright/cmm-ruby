class Sanitizer
  attr_reader :sanitized_text, :text

  def initialize(text)
    @text = text
    @sanitized_text = text
  end
end
