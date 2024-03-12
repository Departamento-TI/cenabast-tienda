module Cenabast::Spree::Api::V2::Platform
  class ContractsController < ::Spree::Api::V2::Platform::ResourceController
    private

    def resource_serializer
      Cenabast::Spree::Api::V2::Platform::ContractSerializer
    end

    def model_class
      Cenabast::Spree::Contract
    end
  end
end
