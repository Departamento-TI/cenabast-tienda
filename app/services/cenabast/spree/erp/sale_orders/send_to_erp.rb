module Cenabast
  module Spree
    module Erp
      module SaleOrders
        # Service that takes an existing SaleOrder model and sends it to the ERP.
        # After the result, it will change the state of the given SaleOrder
        class SendToErp
          attr_accessor :sale_order

          delegate :order, :line_items, :number, to: :sale_order

          def initialize(sale_order)
            @sale_order = sale_order
          end

          def call
            Rails.logger.info { "[#{self.class.name}][#{number}] Sending SaleOrder #{number} to ERP" }

            Rails.logger.info "[#{self.class.name}] Processing ERP order creation response #{response}"

            if response&.dig(:success)
              Rails.logger.info { "[#{self.class.name}][#{number}] Successfull response, will save information" }
              save_success_information!
            else
              process_failure!
            end
          rescue StandardError => e
            Rails.logger.error("[#{self.class.name}] Send to Erp process failed: #{e.message}")
            Rails.logger.debug { "[#{self.class.name}] #{e.backtrace.join("\n")}" }
            process_failure!
          end

          private

          def response
            @response ||= do_request
          end

          def save_success_information!
            return unless (content = response&.dig(:response_content))

            content = content.first if content.instance_of? Array
            content = content&.deep_symbolize_keys

            sale_order.update!(
              status: :sent,
              sent_at: Time.now.in_time_zone,
              erp_pedido_id: content[:pedidoVentaSapId],
              erp_fecha_creacion: content[:fechaCreacion]
            )
          end

          def process_failure!
            msg = <<-MSG
              [#{self.class.name}][#{number}] Unsuccessful response
              or caught exception, will mark sale order as failed and throw exception
            MSG
            Rails.logger.info msg.squish
            sale_order.failed!

            raise StandardError, "[#{self.class.name}]#{number} Send to ERP response not successful!"
          end

          def do_request
            Cenabast::Api::Erp::CreateOrder.new(
              order:,
              line_items:
            ).call
          end
        end
      end
    end
  end
end
