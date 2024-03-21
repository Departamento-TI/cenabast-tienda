module Cenabast
  module Spree
    module Core
      module ControllerHelpers
        module OrderDecorator
          def set_current_order
            return unless try_spree_current_user && current_order

            orders_scope = try_spree_current_user.current_receiver.orders.
                           incomplete.
                           where.not(id: current_order.id).
                           where(store_id: current_store.id)

            orders_scope.each do |order|
              current_order.merge!(order, try_spree_current_user)
            end
          end

          private

          def last_incomplete_order(includes = {})
            @last_incomplete_order ||= try_spree_current_user.current_receiver.last_incomplete_spree_order(current_store, includes:)
          end

          def current_order_params
            { currency: current_currency,
              token: cookies.signed[:token],
              user_id: try_spree_current_user.try(:id),
              receiver_id: try_spree_current_user&.current_receiver&.id }
          end
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::Core::ControllerHelpers::Order.included_modules.exclude?(Cenabast::Spree::Core::ControllerHelpers::OrderDecorator)
end

Spree::Core::ControllerHelpers::Order.prepend Cenabast::Spree::Core::ControllerHelpers::OrderDecorator if decorator_excluded?
