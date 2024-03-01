module Cenabast::Spree::Api::V2::Platform
  class GenericProductsController < ::Spree::Api::V2::Platform::ResourceController
    private

    def resource_serializer
      Cenabast::Spree::Api::V2::Platform::GenericProductSerializer
    end

    def model_class
      Cenabast::Spree::GenericProduct
    end
  end
end
