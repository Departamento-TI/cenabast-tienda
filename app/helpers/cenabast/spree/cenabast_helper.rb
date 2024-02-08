module Cenabast
  module Spree
    module CenabastHelper
      # Convert the Spree::Store available stores array
      # to a format that can be consumed by the header
      def available_stores_to_options
        return [] unless (stores = spree_current_user&.availiable_stores)

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
