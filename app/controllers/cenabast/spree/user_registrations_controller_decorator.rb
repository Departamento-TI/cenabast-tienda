module Cenabast
  module Spree
    module UserRegistrationsControllerDecorator
      def self.prepended(base)
        # Block every action, redirect to root path
        base.include ::RedirectToRoot
      end
    end
  end
end

not_included = Spree::UserRegistrationsController.included_modules.exclude?(Cenabast::Spree::UserRegistrationsControllerDecorator)
Spree::UserRegistrationsController.prepend Cenabast::Spree::UserRegistrationsControllerDecorator if not_included
