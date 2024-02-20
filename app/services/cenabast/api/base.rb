# frozen_string_literal: true

# Parent class acting as a base for Cenabast API calls
module Cenabast
  module Api
    class Base
      def call
        Rails.cache.fetch(cache_key, expires: cache_expire_time) do
          processed_response
        end
      end

      private

      def base_url
        ENV.fetch('CENABAST_API_BASE_URL', 'https://testaplicacionesweb.cenabast.cl:7001')
      end

      def cache_expire_time
        ENV.fetch('CENABAST_API_TOKEN_EXPIRE_TIME', 30).to_i.minutes
      end

      # Which cache key to use
      def cache_key
        "#{url}@#{http_method}"
      end

      # HTTP method to use
      def http_method
        :get
      end

      # Final url in which the API call will be done
      def url
        raise 'subclass must implement this'
      end

      # Should include auth token in headers or not
      def include_auth
        true
      end

      # Default headers to use
      def default_headers
        {
          authorization: ("Bearer #{token}" if include_auth),
          content_type: :json,
          accept: :json
        }.compact
      end

      # Method in charge of actually doing the API call
      def do_request(headers: nil)
        if [:get, :delete].include? http_method
          RestClient.send(http_method, url, headers || default_headers)
        else
          RestClient.send(http_method, url, params, headers || default_headers)
        end
      rescue RestClient::ExceptionWithResponse => e
        e.response
      rescue StandardError
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
          http_code: response&.code,
          success: response_successful?
        }
      end

      # Token related methods
      def token_response
        @token_response ||= Cenabast::Api::TokenFetcher.new.call
      end

      def fetch_token
        return unless token_response&.dig(:success)

        token_response&.dig(:token)
      end

      def token
        @token ||= fetch_token
      end
    end
  end
end
