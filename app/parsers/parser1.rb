class Parser1 < Parser
  def report_data
    each_file do
      json.each do |row|
        report[:russian] << row['rus']
        report[:mathematics] << row['math']
        report[:physics] << row['phys']
      end
    end
  end
end
