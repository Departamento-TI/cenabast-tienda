# frozen_string_literal: true

# Fetches stock information from Cenabast APIs
# Validates if the product stock can supply the order
module Cenabast
  module Spree
    module Order
      class StockValidator
        attr_accessor :order, :error_messages

        # @param order [Spree::Order] order to validate
        def initialize(order)
          @order = order
          @error_messages = []
        end

        # Checks for each line item, if the stock conditions are met
        # returns true if conditions met, false if any error exists
        # @return [User] Returns order if the order meets the conditions, nil otherwise
        def call
          order.reload.line_items.each do |line_item|
            validate_line_item(line_item)
          end

          # return order (valid) if error messages are none
          order unless error_messages.any?
        end

        private

        def fetch_information_for_sku(sku)
          Cenabast::Api::ValidateStockInformationFetcher.new(sku).call
        end

        def validate_line_item(line_item)
          sku = line_item.sku
          info = fetch_information_for_sku(sku)

          if info&.dig(:success)
            stock_content = info[:response_content].deep_symbolize_keys
            is_available = stock_content[:estaDisponible]
            available_quantity = stock_content[:stockDisponible]

            if is_available && available_quantity >= line_item.quantity
              true
            else
              error_messages << ::Spree.t('stock_validator.not_enough_stock', sku:)
            end
          else
            error_messages << ::Spree.t('stock_validator.information_retrieve_error', sku:)
          end
        end
      end
    end
  end
end
