require 'appium_lib'
require 'capybara/cucumber'
require 'dotenv/load'
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

def appium_caps
  { caps: {
      deviceName: 'Emulator',
      platformName: 'Android',
      app: '/Users/tpav/RubyMineProjects/Signup_test/LabCoat/app-debug.apk',
      appPackage: 'com.commit451.gitlab.debug',
      appActivity: 'com.commit451.gitlab.activity.LaunchActivity',
      newCommandTimeout: "3600"
  }}
end

Appium::Driver.new(appium_caps, true)
Appium.promote_appium_methods Object

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

Before('@appium') do
  $driver.start_driver
end

After('@appium') do
  sleep 3
  $driver.remove_app 'com.commit451.gitlab.debug'
  $driver.driver_quit
end


at_exit do
File.delete('Project_owner_user.json') if File.exist?('Project_owner_user.json')
end

at_exit do
File.delete('Developer_user.json') if File.exist?('Developer_user.json')
end

World(FeatureHelper, APIWrapper)

