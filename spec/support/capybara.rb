RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: :component

  config.before(:each, type: :system) do |example|
    if example.metadata[:js]
      driven_by :selenium_chrome_headless
    else
      driven_by :rack_test
    end
  end
end
