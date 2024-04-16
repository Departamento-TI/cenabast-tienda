RSpec.configure do |config|
  config.include Helpers::UserHelper
  config.include Helpers::StoreHelper
  config.include Helpers::PlatformApiHelper
  config.include Helpers::VendorHelper

  config.include Helpers::CheckoutHelper, type: :system
end
