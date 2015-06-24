class TimePeriodSanitizerRule
  def initialize
    @am_replacement = "__am__".freeze
    @pm_replacement = "__pm".freeze
  end

  def sanitize(text)
    text.gsub(/[a|A].[m|M]./, am_replacement).gsub(/[p|P].[m|M]./, pm_replacement)
  end

  def unsanitize(text)
    text.gsub(am_replacement, "a.m.").gsub(pm_replacement, "p.m.")
  end

  private

  def am_replacement
    @am_replacement
  end

  def pm_replacement
    @pm_replacement
  end
end
