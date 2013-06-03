require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test" # Load the test directory.

  test_files = Dir["test/*test*.rb"]
  test_files << Dir["test/lib/rulers/*test*.rb"]
  test_files.flatten!

  t.test_files = test_files
  t.verbose = true
end
