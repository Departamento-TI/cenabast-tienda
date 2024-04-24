module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          module TaxonsControllerDecorator
            # For taxons, we want to have per store control,
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

not_included = Spree::Api::V2::Platform::TaxonsController.included_modules.exclude?(Cenabast::Spree::Api::V2::Platform::TaxonsControllerDecorator)
Spree::Api::V2::Platform::TaxonsController.prepend Cenabast::Spree::Api::V2::Platform::TaxonsControllerDecorator if not_included
