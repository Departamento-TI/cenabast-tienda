module Cenabast
  module Spree
    module UserSessionsControllerDecorator
      def self.prepended(base)
        base.layout 'spree/layouts/devise'
      end

      # Decoration of respond_to_on_destroy original method from
      # spree_auth_devise gem
      def respond_to_on_destroy
        respond_to do |format|
          format.all { head :no_content }
          format.any(*navigational_formats) { redirect_to after_sign_out_path }
        end
      end

      # Manages the redirect to keycloak distribution logout
      # url when the user wants to logout the site.
      def after_sign_out_path
        Cenabast::Keycloak::LogoutUrlBuilder.new.call
      end
    end
  end
end

not_included = Spree::UserSessionsController.included_modules.exclude?(Cenabast::Spree::UserSessionsControllerDecorator)
Spree::UserSessionsController.prepend Cenabast::Spree::UserSessionsControllerDecorator if not_included
