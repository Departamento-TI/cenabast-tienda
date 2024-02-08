module Cenabast
  module Spree
    module StoreControllerDecorator
      def self.prepended(base)
        base.helper 'cenabast/spree/cenabast'
      end
    end
  end
end

not_included = Spree::StoreController.included_modules.exclude?(Cenabast::Spree::StoreControllerDecorator)
Spree::StoreController.prepend Cenabast::Spree::StoreControllerDecorator if not_included
