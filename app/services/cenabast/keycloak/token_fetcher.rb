# frozen_string_literal: true

# Fetches token from Keycloak OpenID API
# Bases common behaviour taken from Cenabast::Api::Base
module Cenabast
  module Keycloak
    class TokenFetcher
      def call
        processed_response
      end

      private

      def include_auth
        false
      end

      def url
        base_url + token_path
      end

      def base_url
        ENV.fetch('KEYCLOAK_SITE_URL', 'https://login-dev.cenabast.gob.cl')
      end

      def token_path
        '/realms/cenabast/protocol/openid-connect/token'
      end

      def client_id
        ENV.fetch('KEYCLOAK_CLIENT_ID', '')
      end

      def client_secret
        ENV.fetch('KEYCLOAK_CLIENT_SECRET', '')
      end

      def params
        {
          grant_type: 'client_credentials',
          client_id:,
          client_secret:,
          scope: 'openid',
        }
      end

      # Default headers to use
      def default_headers
        {
          accept: :json
        }.compact
      end

      # Method in charge of actually doing the API call
      def do_request
        RestClient.send(:post, url, params, default_headers)
      rescue RestClient::ExceptionWithResponse => e
        e.response
      rescue StandardError => e
        Rails.logger.error("[#{self.class.name}] Api request: #{e.message}")
        Rails.logger.debug { "[#{self.class.name}] #{e.backtrace.join("\n")}" }
        nil
      end

      # Memoization of response value
      def response
        @response ||= do_request
      end

      # Parsing of response body
      def response_body
        JSON.parse(response&.body)
      rescue StandardError
        nil
      end

      # id token field
      def id_token
        response_body&.dig('id_token')
      rescue StandardError
        nil
      end

      # Which HTTP codes are actually valid
      def response_accepted_http_statuses
        [200]
      end

      # Helper which determines if request was sucesful
      def response_successful?
        response_accepted_http_statuses.include?(response&.code)
      rescue StandardError
        nil
      end

      # Returns a hash containing the response, extracted important
      # information, and response success status
      def processed_response
        {
          response_body:,
          id_token:,
          http_code: response&.code,
          success: response_successful?
        }
      end
    end
  end
end
