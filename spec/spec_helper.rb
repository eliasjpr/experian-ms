#we need the actual library file
require_relative '../lib/experian_ms'
require 'webmock/rspec'
require 'vcr'

RSpec.configure do |c|
  c.formatter = 'documentation'
end

# VCR configuration
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.hook_into :webmock
end
