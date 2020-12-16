require 'git'
require 'json'
require 'rexml/document'
require 'yaml'

require_relative 'config/constants'

Dir[File.expand_path('**/*.rb', __dir__)].sort.each { |f| require f }
