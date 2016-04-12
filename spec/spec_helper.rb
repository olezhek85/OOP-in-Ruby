require 'codeclimate-test-reporter'
require 'simplecov'

CodeClimate::TestReporter.start
SimpleCov.start

RSpec.configure do |config|
  config.warnings = true
end
