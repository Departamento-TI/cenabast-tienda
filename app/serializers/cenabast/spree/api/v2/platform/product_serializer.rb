module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class ProductSerializer < ::Spree::V2::Storefront::ProductSerializer
            belongs_to :generic_product, serializer: Cenabast::Spree::Api::V2::Platform::GenericProductSerializer
            has_one :contract, serializer: Cenabast::Spree::Api::V2::Platform::ContractSerializer
            has_many :classifications, serializer: ::Spree::Api::V2::Platform::ClassificationSerializer
            has_many :stores, serializer: ::Spree::Api::V2::Platform::StoreSerializer
            has_many :store_products, serializer: ::Spree::Api::V2::Platform::StoreProductSerializer
            has_many :product_properties, serializer: Cenabast::Spree::Api::V2::Platform::ProductPropertySerializer
          end
        end
      end
    end
  end
end
