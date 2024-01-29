module Cenabast
  module Spree
    module VariantDecorator
      def self.prepended(base)
        base.searchkick
      end
    end
  end
end

not_included = Spree::Variant.included_modules.exclude?(Cenabast::Spree::VariantDecorator)
Spree::Variant.prepend Cenabast::Spree::VariantDecorator if not_included