module Cenabast
  module Spree
    module Cart
      class Create
        prepend ::Spree::ServiceModule::Base

        # rubocop:disable Metrics/ParameterLists
        def call(user:, store:, currency:, public_metadata: {}, private_metadata: {}, order_params: {})
          order_params ||= {}

          # we cannot create an order without store
          return failure(:store_is_required) if store.nil?

          default_params = {
            user:,
            receiver: user.current_receiver,
            currency: currency || store.default_currency,
            token: Spree::GenerateToken.new.call(Spree::Order),
            public_metadata: public_metadata.to_h,
            private_metadata: private_metadata.to_h
          }

          order = store.orders.create!(default_params.merge(order_params))
          success(order)
        end
        # rubocop:enable Metrics/ParameterLists
      end
    end
  end
end
