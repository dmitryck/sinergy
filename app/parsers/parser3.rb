class Parser3 < Parser
  def report_data
    each_file do
      report[:mathematics] << scores_of('math')
      report[:physics] << scores_of('phys')
      report[:russian] << scores_of('rus')
    end
  end

  private

  def scores_of(subject)
    xpath("//score[parent::grades/subject[text() = '#{subject}']]/text()")
  end
end
