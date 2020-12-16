# paths
CONFIG_DIR = File.expand_path('.', __dir__)
STORAGE_DIR = File.expand_path('../../storage', __dir__)
SOURCE_REPO = 'https://github.com/ege-rf/ruby-job-test.git'
SOURCE_DIR = "#{STORAGE_DIR}/source"

# main
SUBJECTS = YAML.load_file("#{CONFIG_DIR}/subjects.yml")["subjects"].map(&:to_sym)
PARSERS = YAML.load_file("#{CONFIG_DIR}/parsers.yml")["parsers"]
