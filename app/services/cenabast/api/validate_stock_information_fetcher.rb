# frozen_string_literal: true

# Fetches stock information from Cenabast API for a specific product
# This is used in the checkout, to validate if the available stock
# can supply an order
module Cenabast
  module Api
    class ValidateStockInformationFetcher < Cenabast::Api::Base
      attr_accessor :sale_order

      def call
        # Avoid usage of cache system, always call the endpoint
        processed_response
      end

      # @param sale_order [String] Sale Order (PedidoId) of ZCEN to query
      def initialize(sale_order)
        super()
        @sale_order = sale_order
      end

      private

      def response_successful?
        response_accepted_http_statuses.include?(response&.code) &&
          response_body&.dig('isSuccessStatusCode')
      rescue StandardError
        nil
      end

      def cache_expire_time
        0.to_i.minutes
      end

      def url
        base_url + base_path + user_path
      end

      def user_path
        "/pedido/ValidarStock/#{sale_order}"
      end
    end
  end
end
