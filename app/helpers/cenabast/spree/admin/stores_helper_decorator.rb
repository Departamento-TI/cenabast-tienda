module Cenabast
  module Spree
    module Admin
      module StoresHelperDecorator
        # This helper is used to build the link to switch to each store on the backend
        # interface
        # We decorated this in order to use the toggle_store_path, and
        # then change the user current_store preference
        def store_switcher_link(store)
          if current_store.id == store.id
            classes = 'disabled bg-light'
            icon = svg_icon name: 'circle-fill.svg', width: '18', height: '18'
          else
            classes = nil
            icon = svg_icon name: 'circle.svg', width: '18', height: '18'
          end

          link_to icon + store.unique_name, Rails.application.routes.url_helpers.toggle_store_path(option_id: store.id),
                  class: "#{classes} py-3 px-4 dropdown-item rounded", method: :post, data: { turbo: false }
        end
      end
    end
  end
end

not_included = Spree::Admin::StoresHelper.included_modules.exclude?(Cenabast::Spree::Admin::StoresHelperDecorator)
Spree::Admin::StoresHelper.prepend Cenabast::Spree::Admin::StoresHelperDecorator if not_included
