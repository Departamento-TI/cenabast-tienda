module Cenabast
  module Spree
    module Admin
      module Tabs
        class OrderTabsBuilder
          include ::Rails.application.routes.url_helpers
          include ::Spree::Core::Engine.routes.url_helpers

          def build
            # Take base from OrderDefaultTabsBuilder
            root = ::Spree::Admin::Tabs::OrderDefaultTabsBuilder.new.build

            add_sale_orders_tab(root)

            # Remove non relevant tabs
            root.items.reject! { |it| it.key == 'payments' }
            root.items.reject! { |it| it.key == 'customer_returns' }
            root.items.reject! { |it| it.key == 'return_authorizations' }
            root.items.reject! { |it| it.key == 'channel' }

            root
          end

          private

          def add_sale_orders_tab(root)
            tab =
              ::Spree::Admin::Tabs::TabBuilder.new('sale_orders', ->(resource) { admin_order_sale_orders_path(resource) }).
              with_icon_key('file-earmark-spreadsheet.svg').
              with_active_check.
              with_update_ability_check.
              with_data_hook('admin_order_tabs_sale_order_details').
              build

            root.add(tab)
          end
        end
      end
    end
  end
end
