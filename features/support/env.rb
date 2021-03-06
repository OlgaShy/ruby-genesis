require 'capybara/cucumber'
require 'json'
require 'require_all'
require 'rest-client'
require 'securerandom'
require 'selenium-webdriver'
require 'site_prism'

require_all 'page_objects'
require_relative '../../modules/feature_helper'
require_relative '../../modules/api_helper'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end


World(FeatureHelper)
World(ApiHelper)