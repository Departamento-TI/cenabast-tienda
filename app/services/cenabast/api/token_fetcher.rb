# frozen_string_literal: true

# Fetches token from Cenabast API
# Bases common behaviour taken from Cenabast::Api::Base
module Cenabast
  module Api
    class TokenFetcher < Cenabast::Api::Base
      private

      def include_auth
        false
      end

      def url
        base_url + login_path
      end

      def login_path
        '/interoperabilidad/servicios/v1/usuario/login'
      end

      def user
        ENV.fetch('CENABAST_API_USER', 'tienda')
      end

      def password
        ENV.fetch('CENABAST_API_PASSWORD', 'tienda#2024')
      end

      def params
        {
          user:,
          password:,
        }.to_json
      end

      def http_method
        :post
      end

      def token_value
        response_body&.dig('token')
      end

      def processed_response
        {
          response_body:,
          token: token_value,
          http_code: response.code,
          success: response_successful?
        }
      end
    end
  end
end
