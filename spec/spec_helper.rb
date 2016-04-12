require 'codeclimate-test-reporter'
require 'simplecov'

CodeClimate::TestReporter.start

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start

RSpec.configure do |config|
  config.warnings = true
end
