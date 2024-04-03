module Cenabast
  module Spree
    module OrderDecorator
      # There's currently not payment step in Cenabast checkout, skip it.
      def payment_required?
        false
      end
    end
  end
end

not_included = Spree::Order.included_modules.exclude?(Cenabast::Spree::OrderDecorator)
Spree::Order.prepend Cenabast::Spree::OrderDecorator if not_included
