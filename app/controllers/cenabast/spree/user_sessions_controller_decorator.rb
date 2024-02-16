module Cenabast
  module Spree
    module UserSessionsControllerDecorator
      def self.prepended(base)
        base.layout 'spree/layouts/devise'
      end
    end
  end
end

not_included = Spree::UserSessionsController.included_modules.exclude?(Cenabast::Spree::UserSessionsControllerDecorator)
Spree::UserSessionsController.prepend Cenabast::Spree::UserSessionsControllerDecorator if not_included
