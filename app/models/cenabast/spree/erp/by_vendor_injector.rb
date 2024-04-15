module Cenabast
  module Spree
    module Erp
      # Class responsible for sending orders to the ERP.
      # Group products by vendor and create an ERP Sale order each one.
      class ByVendorInjector < Injector
        def send_order(order)
          Rails.logger.debug { "[#{self.class.name}] Order ERP injection started." }
          order.line_items.group_by { |line_item| line_item.variant.vendor }.each do |_vendor, grouped_line_items|
            sale_order = Cenabast::Spree::Erp::SaleOrder.create_with_line_items!(grouped_line_items)
            sale_order.send_to_erp!
          end
        end
      end
    end
  end
end
