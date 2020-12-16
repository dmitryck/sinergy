require_relative '../requirer'

desc 'Setup project'
task setup: [:data]

desc 'Get/update data files'
task :data do
  begin
    Git.clone(SOURCE_REPO, SOURCE_DIR)
  rescue
    Git.open(SOURCE_DIR).pull
  end
end
