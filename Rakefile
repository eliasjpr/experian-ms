require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.ruby_opts = %w[-w]
  t.verbose = true
end

desc 'Default: run the rspec examples'
task :default => :spec
