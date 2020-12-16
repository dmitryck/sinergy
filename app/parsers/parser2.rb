class Parser2 < Parser
  def report_data
    each_file do
      json.each do |subject, data|
        values = data.sort_by { |e| e['student'] }.map { |e| e['grade'] }
        case subject
        when 'mathematics'
          report[:mathematics]
        when 'russian_language'
          report[:russian]
        when 'physics'
          report[:physics]
        end << values
      end
    end
  end
end
