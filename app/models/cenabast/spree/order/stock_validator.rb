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
        # @return [User] Returns order if the order meets the conditions, nil otherwise
        def can_supply?
          validate_line_item
          error_messages.empty?
        end

        private

        def fetch_information_for_sku(sku)
          Cenabast::Api::ValidateStockInformationFetcher.new(sku).call
        end

        def validate_line_item
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
