# frozen_string_literal: true

# Build logout url to use
module Cenabast
  module Keycloak
    class LogoutUrlBuilder
      include ::Spree::Core::Engine.routes.url_helpers

      def call
        build_url
      end

      private

      def token_service
        @token_service ||= Cenabast::Keycloak::TokenFetcher.new
      end

      def token_response
        @token_response ||= token_service.call
      end

      def base_url
        ENV.fetch('KEYCLOAK_SITE_URL', 'https://login-dev.cenabast.gob.cl')
      end

      def logout_path
        ENV.fetch('KEYCLOAK_LOGOUT_PATH', '/realms/cenabast/protocol/openid-connect/logout')
      end

      def id_token
        return unless token_response&.dig(:success)

        token_response[:id_token]
      end

      def query_params
        {
          post_logout_redirect_uri: new_spree_user_session_url,
          id_token_hint: id_token
        }.compact.to_query
      end

      def build_url
        [
          base_url,
          logout_path,
          "?#{query_params}"
        ].join
      end
    end
  end
end
