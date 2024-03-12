module Cenabast
  module Spree
    module VendorDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasRun
        base.include Cenabast::Spree::CancelValidation

        base.validates_uniqueness_of :run

        base.cancel_validates :name

        base.whitelisted_ransackable_attributes = %w[
          name state slug run email
        ]
      end

      def full_name
        "#{first_name} #{last_name}".strip
      end
    end
  end
end

not_included = Spree::Vendor.included_modules.exclude?(Cenabast::Spree::VendorDecorator)
Spree::Vendor.prepend Cenabast::Spree::VendorDecorator if not_included
