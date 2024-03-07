module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class ProductSerializer < ::Spree::V2::Storefront::ProductSerializer
            has_many :classifications, serializer: ::Spree::Api::V2::Platform::ClassificationSerializer
            has_many :stores, serializer: ::Spree::Api::V2::Platform::StoreSerializer
            has_many :store_products, serializer: ::Spree::Api::V2::Platform::StoreProductSerializer
          end
        end
      end
    end
  end
end
