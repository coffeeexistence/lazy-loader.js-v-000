require_relative '../config/environment'
require_relative '02-features/fixtures/spec_support'

require 'capybara'
require 'rack/test'

include SpecSupport::Cars
include SpecSupport::ClickCars

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
  config.order = 'default'
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.current_driver = Capybara.javascript_driver
Capybara.app = app

