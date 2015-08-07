require 'lutra'

if ENV.fetch('CODECLIMATE_REPO_TOKEN', nil)
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

Dir.glob('./spec/support/**/*.rb') { |file| require file }

RSpec.configure do |config|
  include STDSupport
  include DataSupport
end
