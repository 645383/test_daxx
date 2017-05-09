$LOAD_PATH << './lib'
$LOAD_PATH << './test'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << %w(lib test)
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task :bench do
  require 'words_build_benchmark'
  WordsBench.run
end
