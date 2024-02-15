require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class ClaveUnica < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'clave_unica'

      # https://github.com/omniauth/omniauth-oauth2/issues/58
      option :provider_ignores_state, true

      # https://github.com/keycloak/keycloak/issues/16844#issuecomment-1483915161
      option :scope, 'openid profile email'

      # https://github.com/omniauth/omniauth-oauth2/issues/28
      def callback_url
        full_host + script_name + callback_path
      end

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: ENV.fetch('KEYCLOAK_SITE_URL', 'https://login-dev.cenabast.gob.cl'),
        authorize_url: '/realms/cenabast/protocol/openid-connect/auth',
        token_url: '/realms/cenabast/protocol/openid-connect/token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/realms/cenabast/protocol/openid-connect/userinfo').parsed
      end
    end
  end
end
