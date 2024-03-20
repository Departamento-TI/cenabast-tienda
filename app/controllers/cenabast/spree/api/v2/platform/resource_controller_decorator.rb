module Cenabast
  module Spree
    module Api
      module V2
        module Platform
          module ResourceControllerDecorator
            # Decorated scope to dont use
            # for_store for our default scope
            # dont use cancancan ability
            def scope(_skip_cancancan: false)
              base_scope = model_class
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
  Spree::Api::V2::Platform::ResourceController.included_modules.exclude?(Cenabast::Spree::Api::V2::Platform::ResourceControllerDecorator)
end
Spree::Api::V2::Platform::ResourceController.prepend Cenabast::Spree::Api::V2::Platform::ResourceControllerDecorator if not_included?
