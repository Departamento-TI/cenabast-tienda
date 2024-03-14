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

            def ensure_current_store(object)
              return if object.nil?
              return unless permitted_resource_params&.dig('store_products_attributes')&.any?

              object.store_products = []
              permitted_resource_params['store_products_attributes'].each do |store_products|
                next unless object.stores.exclude?(store = ::Spree::Store.find(store_products[:store_id]))

                object.stores << store
              end
            end
          end
        end
      end
    end
  end
end

not_included = Spree::Api::V2::Platform::ProductsController.included_modules.exclude?(Cenabast::Spree::Api::V2::Platform::ProductsControllerDecorator)
Spree::Api::V2::Platform::ProductsController.prepend Cenabast::Spree::Api::V2::Platform::ProductsControllerDecorator if not_included
