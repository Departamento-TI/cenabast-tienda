require 'rspec/rails'
require 'capybara/rspec'

Capybara.register_driver :remote_selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--remote-debugging-pipe')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444',
    capabilities: options
  )
end

Capybara::Screenshot.register_driver(:remote_selenium) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara.server_host = '0.0.0.0'
Capybara.server = :puma
Capybara.javascript_driver = :remote_selenium
Capybara.app_host = "http://#{Socket.gethostname}:#{Capybara.server_port}"

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: :component

  config.before(:each, type: :system) do |example|
    # `Capybara.app_host` is reset in the RSpec before_setup callback defined
    # in `ActionDispatch::SystemTesting::TestHelpers::SetupAndTeardown`, which
    # is annoying as hell, but not easy to "fix". Just set it manually every
    # test run.
    Capybara.app_host = "http://#{Socket.gethostname}:#{Capybara.server_port}"

    driver = if example.metadata[:js]
               :remote_selenium
             else
               :rack_test
             end

    driven_by driver
  end
end
