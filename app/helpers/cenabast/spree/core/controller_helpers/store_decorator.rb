module Cenabast
  module Spree
    module Core
      module ControllerHelpers
        module StoreDecorator
          # Redefine how the current_store method calls the current_store_finder
          # This is needed because the parametrization is diferent for Cenabast
          # Store will depend on user, not on URL
          def current_store
            @current_store ||= current_store_finder.new(current_user: spree_current_user).execute
          end
        end
      end
    end
  end
end

not_included = Spree::Core::ControllerHelpers::Store.included_modules.exclude?(Cenabast::Spree::Core::ControllerHelpers::StoreDecorator)
Spree::Core::ControllerHelpers::Store.prepend Cenabast::Spree::Core::ControllerHelpers::StoreDecorator if not_included
