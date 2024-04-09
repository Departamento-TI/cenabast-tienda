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

      def fill_default_address_information!
        return unless receiver
        return unless (requester = receiver.requester)

        receiver_address_parts = split_address(receiver.address)

        self.bill_address ||= ::Spree::Address.new(
          firstname: requester.name,
          run: Chilean::Rutify.format_rut(requester.run),
          phone: user.mobile_phone,
          email: user.email,
          address1: receiver_address_parts[:text],
          address1_number: receiver_address_parts[:number]
        )

        self.ship_address ||= ::Spree::Address.new(
          firstname: receiver.name,
          run: Chilean::Rutify.format_rut(receiver.run),
          phone: user.mobile_phone,
          email: user.email,
          address1: receiver_address_parts[:text],
          address1_number: receiver_address_parts[:number]
        )
      end

      private

      def split_address(address)
        match = address&.match(/^(.*?)(\d+)$/)
        if match && match[1] && match[2]
          {
            text: match[1].strip,
            number: match[2].strip
          }
        else
          {
            text: address,
            number: nil
          }
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::Order.included_modules.exclude?(Cenabast::Spree::OrderDecorator)
end

Spree::Order.prepend Cenabast::Spree::OrderDecorator if decorator_excluded?
