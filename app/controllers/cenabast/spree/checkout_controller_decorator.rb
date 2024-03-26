module Cenabast
  module Spree
    module CheckoutControllerDecorator
      def before_address
        check_minimum_purchase_per_vendor
        super
      end

      private

      def check_minimum_purchase_per_vendor
        stats_per_vendor = Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor.new(@order).call
        invalid_order = stats_per_vendor.any? { |vendor| vendor[:valid_minimum_amount] == false }

        if invalid_order
          @order.update(:state, :cart)
          # flash.keep
          redirect_to spree.cart_path, alert: ::Spree.t(:invalid_amount_per_vendor)
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::CheckoutController.included_modules.exclude?(Cenabast::Spree::CheckoutControllerDecorator)
end

Spree::CheckoutController.prepend(Cenabast::Spree::CheckoutControllerDecorator) if decorator_excluded?
