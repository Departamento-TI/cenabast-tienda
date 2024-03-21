module Cenabast
  module Spree
    module OrdersControllerDecorator
      def self.prepended(base)
        # Block every action, redirect to root path
        base.before_action :set_stats_per_vendor, only: [:edit, :update]
      end

      private

      def set_stats_per_vendor
        @stats_per_vendor = Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor.new(@order || current_order).call
      end
    end
  end
end

def not_included
  Spree::OrdersController.included_modules.exclude?(Cenabast::Spree::OrdersControllerDecorator)
end

Spree::OrdersController.prepend Cenabast::Spree::OrdersControllerDecorator if not_included
