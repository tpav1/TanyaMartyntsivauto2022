require 'capybara/cucumber'
require 'require_all'
require 'rest-client'
require 'rspec/expectations'
require 'securerandom'
require 'selenium-webdriver'
require 'site_prism'


require_all 'models'
require_all 'modules'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

at_exit do
  File.delete('user.json') if File.exist?('user.json')
end

World(FeatureHelper)

