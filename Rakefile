require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => [:spec]

desc "run rspec tests"
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = "--format documentation --color"
end
