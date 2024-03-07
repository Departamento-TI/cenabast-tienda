module Cenabast
  module Spree
    module StoreProductDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasDependantDestroyAttributesJsonApi
      end
    end
  end
end

not_included = Spree::StoreProduct.included_modules.exclude?(Cenabast::Spree::StoreProductDecorator)
Spree::StoreProduct.prepend Cenabast::Spree::StoreProductDecorator if not_included
