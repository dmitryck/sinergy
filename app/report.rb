class Report
  BAD_SCORE = 3

  attr_reader :report

  def initialize(report)
    @report = report
  end

  def average_info
    arr = []
    @report.keys.each do |subject|
      arr << "#{subject}: #{average(subject)}"
    end
    arr.join(', ')
  end

  def average(subject)
    math_average(@report[subject])
  end

  def math_average(values)
    (values.sum.to_f / values.count).round(2)
  end

  def bad_learning_info
    "Bad-learning students percentage: #{bad_learning_procentage}%"
  end

  private

  def bad_learning_procentage
    values = @report.values

    students_with_bad_score_on_any_subject =
      values
        .transpose
        .map { |v| v.keep_if { |v| v <= BAD_SCORE } }
        .keep_if { |v| v.any? }
        .count

    100 * (students_with_bad_score_on_any_subject.to_f / values[0].count).round(2)
  end
end
