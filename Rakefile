# Rakefile
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test'
  test.ruby_opts << "-rubygems"
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

# Default directory to look in is `/specs`
# Run with `rake spec`
# RSpec::Core::RakeTask.new(:spec) do |task|
#   task.rspec_opts = ['--color', '--format', 'nested']
# end

# task :default => :spec