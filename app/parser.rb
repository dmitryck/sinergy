class Parser
  @@parsers = []

  @@report = {}
  SUBJECTS.each { |subject| @@report[subject] = []}

  def self.inherited(parser)
    @@parsers << parser
  end

  def self.report_data
    for parser in @@parsers
      parser.new.report_data
    end
    @@report.transform_values!(&:flatten)
    @@report.transform_values! { |v| v.map { |v| v.to_s.to_i } }
  end
  
  def initialize
    @files = PARSERS[self.class.name].map do |file|
      "#{SOURCE_DIR}/data/#{file}"
    end
  end

  private

  def each_file
    for @file in @files
      yield
    end
  end

  def report
    @@report
  end

  def data
    @data ||= File.read(@file)
  end

  def json
    @json ||= JSON.parse(data)
  end

  def xml
    @xml ||= REXML::Document.new(data)
  end

  def xpath(expression)
    REXML::XPath.match(xml, expression)
  end
end
