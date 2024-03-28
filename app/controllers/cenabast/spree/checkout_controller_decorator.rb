module Cenabast
  module Spree
    module CheckoutControllerDecorator
      def self.prepended(base)
        base.before_action :check_minimum_purchase_per_vendor
      end

      def before_address
        check_minimum_purchase_per_vendor

        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:address_substep, 0)
        # rubocop:enable Rails/SkipsModelValidations
        super
      end

      private

      def check_minimum_purchase_per_vendor
        stats_per_vendor = Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor.new(@order).call
        invalid_order = stats_per_vendor.any? { |vendor| vendor[:valid_minimum_amount] == false }

        if invalid_order
          @order.update(state: :cart)
          flash[:error] = ::Spree.t(:invalid_amount_per_vendor)
          redirect_to spree.cart_path
      end

      # Allows us the "substeps" of the address step
      def address_move_step
        return unless @order && @order.state == 'address'
        return unless [0, 1].include? params[:address_substep].to_i

        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:address_substep, params[:address_substep].to_i)
        # rubocop:enable Rails/SkipsModelValidations

        respond_to do |format|
          format.js
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::CheckoutController.included_modules.exclude?(Cenabast::Spree::CheckoutControllerDecorator)
end

Spree::CheckoutController.prepend(Cenabast::Spree::CheckoutControllerDecorator) if decorator_excluded?
