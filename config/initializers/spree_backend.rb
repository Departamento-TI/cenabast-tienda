Rails.application.config.after_initialize do
  Rails.application.reload_routes!

  # Set up tabs for order in backoffice view
  order_tabs = Cenabast::Spree::Admin::Tabs::OrderTabsBuilder.new.build
  Rails.application.config.spree_backend.tabs[:order] = order_tabs
end
