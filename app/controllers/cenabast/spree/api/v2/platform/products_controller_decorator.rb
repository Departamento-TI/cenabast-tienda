module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          module ProductsControllerDecorator
            def spree_permitted_attributes
              super + [{
                store_products_attributes: ::Spree::StoreProduct.json_api_permitted_attributes,
                classifications_attributes: ::Spree::Classification.json_api_permitted_attributes,
                product_properties_attributes: ::Spree::ProductProperty.json_api_permitted_attributes,
              }]
            end

            def resource_serializer
              Cenabast::Spree::Api::V2::Platform::ProductSerializer
            end
          end
        end
      end
    end
  end
end

not_included = Spree::Api::V2::Platform::ProductsController.included_modules.exclude?(Cenabast::Spree::Api::V2::Platform::ProductsControllerDecorator)
Spree::Api::V2::Platform::ProductsController.prepend Cenabast::Spree::Api::V2::Platform::ProductsControllerDecorator if not_included
