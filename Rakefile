require "rspec/core/rake_task"
require 'rubocop/rake_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

task :default => [:rubocop, :spec]
