module Spree
  module Admin
    class SaleOrdersController < ResourceController
      belongs_to 'spree/order', find_by: :number

      before_action :load_sale_order, except: [:index]

      skip_before_action :load_resource, only: [:nullify]

      def index
        @sale_orders = @order.sale_orders.order(created_at: :asc)
      end

      def nullify
        @sale_order.cancel_in_erp!
        flash[:success] = Spree.t('admin.orders.nullify_sale_order_sent_message', number: @sale_order.number)
        redirect_to admin_order_sale_orders_path(@order)
      end

      private

      def load_sale_order
        @order = Spree::Order.find_by(number: params[:order_id])
        @sale_order = @object = @order.sale_orders.find_by!(number: params[:id])
      end

      def model_class
        ::Cenabast::Spree::Erp::SaleOrder
      end
    end
  end
end
