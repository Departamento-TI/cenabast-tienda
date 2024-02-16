module Cenabast
  module Spree
    module UserPasswordsControllerDecorator
      def self.prepended(base)
        # Block every action, redirect to root path
        base.include ::RedirectToRoot
      end
    end
  end
end

not_included = Spree::UserPasswordsController.included_modules.exclude?(Cenabast::Spree::UserPasswordsControllerDecorator)
Spree::UserPasswordsController.prepend Cenabast::Spree::UserPasswordsControllerDecorator if not_included
