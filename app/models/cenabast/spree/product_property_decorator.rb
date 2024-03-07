module Cenabast
  module Spree
    module ProductPropertyDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasDependantDestroyAttributesJsonApi
      end
    end
  end
end

not_included = Spree::ProductProperty.included_modules.exclude?(Cenabast::Spree::ProductPropertyDecorator)
Spree::ProductProperty.prepend Cenabast::Spree::ProductPropertyDecorator if not_included
