module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class GenericProductSerializer < ::Spree::Api::V2::Platform::BaseSerializer
            include Cenabast::Spree::Api::V2::ResourceSerializerConcern

            attributes :code
            attributes :code_atc
            attributes :code_onu
            attributes :code_ean
            attributes :denomination
            attributes :standard_denomination
            attributes :product_type
            attributes :hierarchy
            attributes :ump
            attributes :manufacturer
            attributes :base_table
          end
        end
      end
    end
  end
end
