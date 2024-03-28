module Cenabast
  module Spree
    module CheckoutControllerDecorator
      def before_address
        # rubocop:disable Rails/SkipsModelValidations
        @order.update_column(:address_substep, 0)
        # rubocop:enable Rails/SkipsModelValidations
        super
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
