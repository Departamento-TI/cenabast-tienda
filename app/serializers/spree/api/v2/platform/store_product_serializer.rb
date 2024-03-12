module Spree
  module Api
    module V2
      module Platform
        # Additional serializer of intermediate model
        # StoreProduct, that wasnt on Spree api serializers
        class StoreProductSerializer < BaseSerializer
          attribute :store_id, :product_id
        end
      end
    end
  end
end
