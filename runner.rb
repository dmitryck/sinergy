require_relative 'app/requirer'

report = Report.new(Parser.report_data)

puts 'Average Scores:'
puts report.average_info
puts report.bad_learning_info

# if need average of subject
# puts report.average(:russian)

# if need all report values:
# puts report.report
