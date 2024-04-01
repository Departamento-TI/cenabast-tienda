module Cenabast
  module Spree
    module AddressDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasCounty
      end
    end
  end
end

not_included = Spree::Address.included_modules.exclude?(Cenabast::Spree::AddressDecorator)
Spree::Address.prepend Cenabast::Spree::AddressDecorator if not_included
