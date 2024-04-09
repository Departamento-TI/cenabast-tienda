module Cenabast
  module Spree
    module Erp
      # Class responsible for sending orders to the ERP per product.
      # This class follows Strategy pattern design
      class ByProductInjector < Injector
        def send_order(order)
          order.line_items.each do |line_item|
            Cenabast::Api::Erp::CreateOrder.new(order:, line_items: [line_item]).call
          end
        end
      end
    end
  end
end
