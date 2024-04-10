# frozen_string_literal: true

# Fetches stock information from Cenabast API for a specific product
# This is used in the checkout, to validate if the available stock
# can supply an order
module Cenabast
  module Api
    class ValidateStockInformationFetcher < Cenabast::Api::Base
      attr_accessor :sku

      def call
        # Avoid usage of cache system, always call the endpoint
        processed_response
      end

      # @param sku [String] SKU of ZCEN to query
      def initialize(sku)
        super()
        @sku = sku
      end

      private

      def cache_expire_time
        0.to_i.minutes
      end

      def url
        base_url + base_path + user_path
      end

      def user_path
        "/pedido/ValidarStock/#{sku}"
      end
    end
  end
end
