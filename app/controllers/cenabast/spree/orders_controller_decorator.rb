module Cenabast
  module Spree
    module OrdersControllerDecorator
      def self.prepended(base)
        # Block every action, redirect to root path
        base.before_action :set_stats_per_vendor, only: [:edit, :update]
      end

      # Shows the current incomplete order from the session
      # it will be created if isn't exists
      def edit
        @order = current_order(create_order_if_necessary: true)
      end

      private

      def set_stats_per_vendor
        @stats_per_vendor = Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor.new(@order || current_order).call
      end
    end
  end
end

def decorator_excluded?
  Spree::OrdersController.included_modules.exclude?(Cenabast::Spree::OrdersControllerDecorator)
end

Spree::OrdersController.prepend(Cenabast::Spree::OrdersControllerDecorator) if decorator_excluded?
