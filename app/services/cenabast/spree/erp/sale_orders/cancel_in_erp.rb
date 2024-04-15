module Cenabast
  module Spree
    module Erp
      module SaleOrders
        # Service that takes an existing SaleOrder model and cancels it in the ERP.
        # After the result, it will change the state of the given SaleOrder
        class SendToErp
          attr_accessor :sale_order

          delegate :order, :line_items, :number, to: :sale_order

          def initialize(sale_order)
            @sale_order = sale_order
          end

          def call
            # If sale order is already nullfied, dont do anything.
            return if sale_order.nullified?

            Rails.logger.info { "[#{self.class.name}][#{number}] Sending request to cancelling SaleOrder #{number} in ERP" }

            if response&.dig(:success)
              Rails.logger.info { "[#{self.class.name}][#{number}] Successfull response, will save information" }
              save_success_information!
            else
              process_failure!
            end
          rescue StandardError => e
            Rails.logger.error("[#{self.class.name}] Cancel in Erp process failed: #{e.message}")
            Rails.logger.debug { "[#{self.class.name}] #{e.backtrace.join("\n")}" }
            process_failure!
          end

          private

          def response
            @response ||= do_request
          end

          def save_success_information!
            sale_order.update!(
              status: :nullified,
              nullified_at: Time.now.in_time_zone
            )
          end

          def process_failure!
            msg = <<-MSG
              [#{self.class.name}][#{number}] Unsuccessful response
              or caught exception, will throw exception
            MSG
            Rails.logger.info msg.squish

            raise StandardError, "[#{self.class.name}]#{number} Cancel in ERP response not successful!"
          end

          def do_request
            Cenabast::Api::Erp::CancelOrder.new(erp_pedido_id.to_i).call
          end
        end
      end
    end
  end
end
