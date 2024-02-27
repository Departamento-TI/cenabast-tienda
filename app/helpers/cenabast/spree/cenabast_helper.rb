module Cenabast
  module Spree
    module CenabastHelper
      # Convert the Cenabast::Spree::Requester available requesters array
      # to a format that can be consumed by the header
      def available_requesters_to_options
        return [] unless (requesters = spree_current_user&.available_requesters)

        requesters.map do |requester|
          {
            title: requester.name,
            id: requester.id
          }
        end
      end

      # Convert the Cenabast::Spree::Receiver available receivers array
      # to a format that can be consumed by the header
      def available_receivers_to_options
        return [] unless (receivers = spree_current_user&.available_receivers)

        receivers.map do |receiver|
          {
            title: receiver.name,
            id: receiver.id
          }
        end
      end

      # Convert the Spree::Store available stores array
      # to a format that can be consumed by the header
      def available_stores_to_options
        return [] unless (stores = spree_current_user&.available_stores)

        stores.map do |store|
          {
            title: store.name,
            id: store.id
          }
        end
      end
    end
  end
end
