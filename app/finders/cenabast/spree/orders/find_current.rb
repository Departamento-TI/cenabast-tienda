module Cenabast
  module Spree
    module Orders
      class FindCurrent
        def execute(user:, store:, **params)
          incomplete_orders.order(created_at: :desc).
            find_by(store:, receiver: user.current_receiver, currency: params[:currency])
        end

        private

        def incomplete_orders
          Spree::Order.incomplete.not_canceled
        end
      end
    end
  end
end
