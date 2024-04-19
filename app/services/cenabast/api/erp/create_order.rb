# frozen_string_literal: true

module Cenabast
  module Api
    module Erp
      class CreateOrder < Cenabast::Api::Base
        attr_reader :order

        def initialize(order:, line_items:)
          super()
          @order = order
          @line_items = line_items
        end

        def call
          # Avoid usage of cache system, always call the endpoint
          processed_response
        end

        private

        def url
          URI.join(base_url, "#{base_path}/pedido").to_s
        end

        def http_method
          :post
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

        def params
          {
            RutSolicitante: order.receiver.requester.raw_run,
            DetalleProductos:
              @line_items&.map do |line_item|
                {
                  DocumentoCompra: line_item.variant.product.contract&.sale_order.to_i,
                  CodigoOcChilecompra: line_item.variant.product.contract&.mercado_publico_oc,
                  CodigoMaterial: line_item.sku.to_i,
                  CantidadSolicitada: line_item.quantity,
                  CodigoDestinatario: order.receiver.raw_run,
                  PuertoDescarga: order.selected_delivery_port,
                  FechaEntrega: 7.business_days.from_now
                }
              end
          }.to_json
        end
      end
    end
  end
end
