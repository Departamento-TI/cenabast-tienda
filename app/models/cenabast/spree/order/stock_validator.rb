# frozen_string_literal: true

# Fetches stock information from Cenabast APIs
# Validates if the product stock can supply the order
module Cenabast
  module Spree
    module Order
      class StockValidator
        attr_accessor :line_item, :error_messages

        # @param line_item [Spree::LineItem] to validate
        def initialize(line_item)
          @line_item = line_item
          @error_messages = []
        end

        # Checks the line item, if the stock conditions are met
        # returns true if conditions met, false if any error exists
        # @return [Boolean]
        def can_supply?
          validate_line_item
          error_messages.empty?
        end

        private

        def sale_order
          @sale_order ||= line_item&.product&.contract&.sale_order
        end

        def fetch_information_for_line_item
          return unless sale_order

          Cenabast::Api::ValidateStockInformationFetcher.new(sale_order).call
        end

        def validate_line_item
          info = fetch_information_for_line_item

          if info&.dig(:success)
            stock_content = info[:response_content].deep_symbolize_keys
            available_quantity = stock_content[:cantidadDisponible]

            if available_quantity && available_quantity >= line_item.quantity
              true
            else
              error_messages << ::Spree.t('stock_validator.not_enough_stock', sale_order:)
            end
          else
            error_messages << ::Spree.t('stock_validator.information_retrieve_error', sale_order:)
          end
        end
      end
    end
  end
end
