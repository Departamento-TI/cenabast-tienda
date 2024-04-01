module Cenabast
  module Spree
    module Api
      module V2
        module Storefront
          class CountySerializer < ::Spree::V2::Storefront::BaseSerializer
            include Cenabast::Spree::Api::V2::ResourceSerializerConcern
          end
        end
      end
    end
  end
end
