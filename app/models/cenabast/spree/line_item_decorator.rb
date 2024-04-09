module Cenabast
  module Spree
    module LineItemDecorator
      # Overrides the function to validate stock using the Cenabast API stock
      def sufficient_stock?
        Cenabast::Spree::Order::StockValidator.new(self).can_supply?
      end
    end
  end
end

def decorator_excluded?
  Spree::LineItem.included_modules.exclude?(Cenabast::Spree::LineItemDecorator)
end

Spree::LineItem.prepend Cenabast::Spree::LineItemDecorator if decorator_excluded?
