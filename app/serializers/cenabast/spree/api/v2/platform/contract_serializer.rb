module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class ContractSerializer < ::Spree::Api::V2::Platform::BaseSerializer
            include Cenabast::Spree::Api::V2::ResourceSerializerConcern

            attributes :code
            attributes :name
            attributes :product_id
            attributes :sale_order
            attributes :mercado_publico_id
            attributes :mercado_publico_oc
            attributes :center
            attributes :price_before_iva
            attributes :price_iva
            attributes :price
            attributes :comission
            attributes :available_on
            attributes :discontinue_on
            attributes :unit_sale
            attributes :unit
          end
        end
      end
    end
  end
end
