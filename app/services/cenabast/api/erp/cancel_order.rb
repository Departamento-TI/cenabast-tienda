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

        private

        def url
          URI.join(base_url, "#{base_path}/pedido/CancelarPedido/#{order}").to_s
        end

        def http_method
          :patch
        end

        def params; end
      end
    end
  end
end
