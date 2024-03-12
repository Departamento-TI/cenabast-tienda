module Cenabast
  module Spree
    module PropertyDecorator
      def self.prepended(base)
        base.validates_uniqueness_of :name
      end
    end
  end
end

not_included = Spree::Property.included_modules.exclude?(Cenabast::Spree::PropertyDecorator)
Spree::Property.prepend Cenabast::Spree::PropertyDecorator if not_included
