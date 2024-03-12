module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class ContractSerializer < ::Spree::Api::V2::Platform::BaseSerializer
            include Cenabast::Spree::Api::V2::ResourceSerializerConcern

            belongs_to :product, serializer: ::Spree::Api::V2::Platform::ProductSerializer
          end
        end
      end
    end
  end
end
