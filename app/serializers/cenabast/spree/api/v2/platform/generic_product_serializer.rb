module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          class GenericProductSerializer < ::Spree::Api::V2::Platform::BaseSerializer
            include Cenabast::Spree::Api::V2::ResourceSerializerConcern
          end
        end
      end
    end
  end
end
