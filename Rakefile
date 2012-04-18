require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yard'

task :default => [:spec]

desc "run rspec tests"
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = "--format documentation --color"
end

YARD::Rake::YardocTask.new do |task|
  task.options = %w[--markup markdown]
end
