# frozen_string_literal: true

module Cenabast
  module Api
    module Erp
      class CancelOrder < Cenabast::Api::Base
        attr_reader :order

        def initialize(order_id)
          super()
          @order = order_id
        end

        def call
          # Avoid usage of cache system, always call the endpoint
          processed_response
        end

        private

        def url
          URI.join(base_url, "#{base_path}/pedido/CancelarPedido/#{order}").to_s
        end

        def http_method
          :patch
        end

        def logger_level
          :info
        end

        def response_successful?
          response_accepted_http_statuses.include?(response&.code) &&
            response_body&.dig('isSuccessStatusCode')
        rescue StandardError
          nil
        end
      end
    end
  end
end
