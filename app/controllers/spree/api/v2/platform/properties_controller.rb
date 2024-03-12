module Spree::Api::V2::Platform
  class PropertiesController < Spree::Api::V2::Platform::ResourceController
    private

    def resource_serializer
      Spree::Api::V2::Platform::PropertySerializer
    end

    def model_class
      Spree::Property
    end
  end
end
