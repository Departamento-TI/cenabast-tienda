module Cenabast
  module Spree
    module Core
      module ControllerHelpers
        module OrderDecorator
          # comment this code
          # rubocop:disable Rails/HelperInstanceVariable
          def current_order(options = {})
            options[:create_order_if_necessary] ||= false
            options[:includes] ||= true

            if @current_order
              @current_order.last_ip_address = ip_address
              return @current_order
            end

            @current_order = find_order_by_token_or_user(options, true)

            if options[:create_order_if_necessary] && (@current_order.nil? || @current_order.completed?)
              @current_order = current_store.orders.create!(current_order_params)
              @current_order.associate_user! try_spree_current_user if try_spree_current_user
              @current_order.associate_receiver! try_spree_current_user.current_receiver if try_spree_current_user
              @current_order.last_ip_address = ip_address
            end

            @current_order
          end

          def associate_receiver
            @order ||= current_order
            @order.associate_receiver!(try_spree_current_user.current_receiver) if try_spree_current_user && @order && @order.receiver.blank?
          end
          # rubocop:enable Rails/HelperInstanceVariable

          private

          def last_incomplete_order(includes = {})
            @last_incomplete_order ||= try_spree_current_user.current_receiver.last_incomplete_spree_order(current_store, includes:)
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
