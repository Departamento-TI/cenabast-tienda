#
# Place all seeds in /seeds/ folder.
#

Spree::Webhooks.disable_webhooks do
  Dir["#{File.dirname(__FILE__)}/seeds/*.rb"].each do |file|
    Rails.logger.info "Seeds #{file} ..."
    require file
  end
end
