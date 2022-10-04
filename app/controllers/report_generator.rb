class ReportGenerator
  attr_accessor :report

  def initialize
    @report = {}
  end

  def add_key_to_report(key, value)
    @report[key] = value
  end
end
