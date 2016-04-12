require 'codeclimate-test-reporter'
require 'coveralls'

Coveralls.wear!
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.warnings = true
end
