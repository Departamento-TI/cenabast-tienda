module Spree::Api::V2::Platform
  class StoresController < Spree::Api::V2::Platform::ResourceController
    private

    def resource_serializer
      Spree::Api::V2::Platform::StoreSerializer
    end

    def model_class
      Spree::Store
    end
  end
end
