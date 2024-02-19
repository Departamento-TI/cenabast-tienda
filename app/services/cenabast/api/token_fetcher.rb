# frozen_string_literal: true

# Fetches token from Cenabast API
module Cenabast
  module Api
    class TokenFetcher
      def call
        Rails.cache.fetch(cache_key, expires: cache_expire_time) do
          processed_response
        end
      end

      private

      def url
        base_url + login_path
      end

      def cache_key
        "#{url}@post"
      end

      def cache_expire_time
        ENV.fetch('CENABAST_API_TOKEN_EXPIRE_TIME', 30).to_i.minutes
      end

      def base_url
        ENV.fetch('CENABAST_API_BASE_URL', 'https://testaplicacionesweb.cenabast.cl:7001')
      end

      def user
        ENV.fetch('CENABAST_API_USER', 'tienda')
      end

      def password
        ENV.fetch('CENABAST_API_PASSWORD', 'tienda#2024')
      end

      def login_path
        '/interoperabilidad/servicios/v1/usuario/login'
      end

      def request_body
        {
          user:,
          password:,
        }.to_json
      end

      def do_request
        RestClient.post(
          url,
          request_body,
          content_type: :json,
          accept: :json
        )
      rescue RestClient::ExceptionWithResponse => e
        e.response
      rescue StandardError
        false
      end

      def response
        @response ||= do_request
      end

      def response_body
        JSON.parse(response&.body).deep_symbolize_keys
      rescue StandardError
        nil
      end

      def response_accepted_http_statuses
        [200]
      end

      def response_successful?
        response_accepted_http_statuses.include?(response&.code)
      rescue StandardError
        false
      end

      def token
        response_body&.dig(:token)
      end

      def processed_response
        {
          token:,
          response_body:,
          http_code: response.code,
          success: response_successful?
        }
      end
    end
  end
end
