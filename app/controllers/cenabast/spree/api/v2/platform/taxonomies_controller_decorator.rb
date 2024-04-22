module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          module TaxonomiesControllerDecorator
            # For taxonomies, we want to have per store control,
            # As there api methods are used in the backoffice.
            # Re-decorated scope method.
            # TODO: Find a better way to solve this
            def scope(_skip_cancancan: false)
              base_scope = model_class.for_store(current_store)
              base_scope = base_scope.includes(scope_includes) if scope_includes.any? && action_name == 'index'
              model_class.include?(::Spree::TranslatableResource) ? base_scope.i18n : base_scope
            end
          end
        end
      end
    end
  end
end

def not_included?
  klass = Cenabast::Spree::Api::V2::Platform::TaxonomiesControllerDecorator
  Spree::Api::V2::Platform::TaxonomiesController.included_modules.exclude?(klass)
end

Spree::Api::V2::Platform::TaxonomiesController.prepend Cenabast::Spree::Api::V2::Platform::TaxonomiesControllerDecorator if not_included?
