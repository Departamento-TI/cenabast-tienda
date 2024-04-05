module Cenabast
  module Spree
    module CheckoutControllerDecorator
      def self.prepended(base)
        base.layout 'spree/layouts/spree_application'
        base.before_action :check_minimum_purchase_per_vendor
      end

      def before_address
        check_minimum_purchase_per_vendor

        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:order_substep, 0)
        # rubocop:enable Rails/SkipsModelValidations
        super
      end

      def before_delivery
        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:order_substep, 0)
        # rubocop:enable Rails/SkipsModelValidations
        super
      end

      # Updates the order and advances to the next state (when possible.)
      # This method was decorated to allow flash error messages to be sent when
      # update_from_params returns a falsy value
      def update
        if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
          @order.temporary_address = !params[:save_user_address]
          unless @order.next
            flash[:error] = @order.errors.full_messages.join("\n")
            redirect_to(spree.checkout_state_path(@order.state)) && return
          end

          if @order.completed?
            @current_order = nil
            flash['order_completed'] = true
            redirect_to completion_route
          else
            redirect_to spree.checkout_state_path(@order.state)
          end
        else
          flash.now[:error] = @order.errors.full_messages.join("\n")
          render :edit, status: :unprocessable_entity
        end
      end

      # Allows us the "substeps" of the address/delivery step
      def move_substep
        return unless @order
        return unless [0, 1].include? params[:order_substep].to_i

        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:order_substep, params[:order_substep].to_i)
        @order.update_column(:state, params[:state]) if ['address', 'delivery'].include? params[:state]
        # rubocop:enable Rails/SkipsModelValidations

        respond_to do |format|
          format.js
        end
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
      end
    end
  end
end

def decorator_excluded?
  Spree::CheckoutController.included_modules.exclude?(Cenabast::Spree::CheckoutControllerDecorator)
end

Spree::CheckoutController.prepend(Cenabast::Spree::CheckoutControllerDecorator) if decorator_excluded?
