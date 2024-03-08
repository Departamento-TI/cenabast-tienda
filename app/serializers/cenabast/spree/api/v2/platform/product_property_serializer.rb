module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class ProductPropertySerializer < ::Spree::V2::Storefront::ProductPropertySerializer
            attribute :product_id, :property_id
          end
        end
      end
    end
  end
end
