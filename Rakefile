require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

task default: [:reek, :spec, :rubocop]
