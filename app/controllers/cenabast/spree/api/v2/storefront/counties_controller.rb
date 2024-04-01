module Cenabast
  module Spree
    module Api
      module V2
        module Storefront
          # Code taken from spree_counties gem
          class CountiesController < ::Spree::Api::V2::ResourceController
            private

            def scope(skip_cancancan: false)
              base_scope = model_class
              base_scope = base_scope.accessible_by(current_ability, :show) unless skip_cancancan
              base_scope = base_scope.includes(scope_includes) if scope_includes.any? && action_name == 'index'
              model_class.include?(::Spree::TranslatableResource) ? base_scope.i18n : base_scope
            end

            def model_class
              ::Spree::County
            end

            def resource_serializer
              collection_serializer
            end

            def collection_serializer
              Cenabast::Spree::Api::V2::Storefront::CountySerializer
            end

            def collection_finder
              Cenabast::Spree::Counties::Find
            end
          end
        end
      end
    end
  end
end
