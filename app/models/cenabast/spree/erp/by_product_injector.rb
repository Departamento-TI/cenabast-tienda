module Cenabast
  module Spree
    module Erp
      # Class responsible for sending orders to the ERP per product.
      # This class follows Strategy pattern design
      # Creates by each line item a different Erp SaleOrder, and sends them to the erp
      class ByProductInjector < Injector
        def send_order(order)
          order.line_items.each do |line_item|
            sale_order = Cenabast::Spree::Erp::SaleOrder.create_with_line_items!([line_item])
            sale_order.send_to_erp!
          end
        end
      end
    end
  end
end
