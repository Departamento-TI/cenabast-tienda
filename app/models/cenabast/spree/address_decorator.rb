module Cenabast
  module Spree
    module AddressDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasCounty
        base.include Cenabast::Spree::HasRun

        base.before_validation :adjust_missing_fields
      end

      private

      def adjust_missing_fields
        # Spree has validators for those fields
        # Place some filler values if needed
        self.lastname ||= '--'
        self.city ||= county&.name || '--'
      end
    end
  end
end

Spree::Address::ADDRESS_FIELDS = %w(
  firstname lastname company address1 address1_number
  address2 city state zipcode country phone
)

not_included = Spree::Address.included_modules.exclude?(Cenabast::Spree::AddressDecorator)
Spree::Address.prepend Cenabast::Spree::AddressDecorator if not_included
