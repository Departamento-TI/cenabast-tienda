RSpec.configure do |config|
  config.include Helpers::UserHelper
  config.include Helpers::StoreHelper
  config.include Helpers::PlatformApiHelper
end
