module Cenabast
  module Spree
    module UserConfirmationsControllerDecorator
      def self.prepended(base)
        # Block every action, redirect to root path
        base.include ::RedirectToRoot
      end
    end
  end
end

not_included = Spree::UserConfirmationsController.included_modules.exclude?(Cenabast::Spree::UserConfirmationsControllerDecorator)
Spree::UserConfirmationsController.prepend Cenabast::Spree::UserConfirmationsControllerDecorator if not_included
