module Cenabast
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.belongs_to :receiver, class_name: 'Cenabast::Spree::Receiver', optional: false

        base.state_machine.after_transition to: :complete, do: :inject_to_erp!
      end

      def inject_to_erp!
        injector = Cenabast::Spree::Erp::InjectorFactory.create_injector
        injector.send_order self
      end

      # There's currently not payment step in Cenabast checkout, skip it.
      def payment_required?
        false
      end
    end
  end
end

def decorator_excluded?
  Spree::Order.included_modules.exclude?(Cenabast::Spree::OrderDecorator)
end

Spree::Order.prepend Cenabast::Spree::OrderDecorator if decorator_excluded?
