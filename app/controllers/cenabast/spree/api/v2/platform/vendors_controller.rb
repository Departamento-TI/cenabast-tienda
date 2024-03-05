module Cenabast::Spree::Api::V2::Platform
  class VendorsController < ::Spree::Api::V2::Platform::ResourceController
    private

    def resource_serializer
      Cenabast::Spree::Api::V2::Platform::VendorSerializer
    end

    def model_class
      ::Spree::Vendor
    end
  end
end
