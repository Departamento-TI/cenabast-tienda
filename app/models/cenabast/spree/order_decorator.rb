module Cenabast
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.belongs_to :receiver, class_name: 'Cenabast::Spree::Receiver', optional: false
        base.state_machine.after_transition from: :cart, do: :valid_minimum_purchase_per_vendor?
      end

      def valid_minimum_purchase_per_vendor?
        stats_per_vendor = Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor.new(self).call
        invalid_order = stats_per_vendor.any? { |vendor| vendor[:valid_minimum_amount] == false }
        if invalid_order
          errors.add(:base, ::Spree.t(:invalid_amount_per_vendor))
          false
        else
          true
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::Order.included_modules.exclude?(Cenabast::Spree::OrderDecorator)
end

Spree::Order.prepend Cenabast::Spree::OrderDecorator if decorator_excluded?
