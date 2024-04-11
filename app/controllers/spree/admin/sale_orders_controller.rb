module Spree
  module Admin
    class SaleOrdersController < ResourceController
      belongs_to 'spree/order', find_by: :number

      def index
        @sale_orders = @order.sale_orders.order(created_at: :asc)
      end

      private

      def model_class
        ::Cenabast::Spree::Erp::SaleOrder
      end
    end
  end
end
