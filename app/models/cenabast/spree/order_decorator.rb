module Cenabast
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.belongs_to :receiver, class_name: 'Cenabast::Spree::Receiver'
      end

      # Associates the specified receiver with the order.
      def associate_receiver!(receiver)
        self.receiver = receiver
        save
      end
    end
  end
end

def decorator_excluded?
  Spree::Order.included_modules.exclude?(Cenabast::Spree::OrderDecorator)
end

Spree::Order.prepend Cenabast::Spree::OrderDecorator if decorator_excluded?
