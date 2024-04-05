module Cenabast
  module Spree
    module Erp
      class ByVendorInjector < Injector
        def send_order(order)
          Rails.logger.debug { "[#{self.class.name}] Order ERP injection started." }
          order.line_items.group_by { |line_item| line_item.variant.vendor }.each do |_vendor, grouped_line_items|
            response = Cenabast::Api::Erp::CreateOrder.new(order:, line_items: grouped_line_items).call
            process_response(response)
          end
        end

        private

        def process_response(response)
          Rails.logger.info "[#{self.class.name}] Processing ERP order creation response #{response}"
        end
      end
    end
  end
end
