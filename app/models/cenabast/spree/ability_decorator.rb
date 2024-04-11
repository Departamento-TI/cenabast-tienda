module Cenabast
  module Spree
    module AbilityDecorator
      def abilities_to_register
        [OrderReceiverAbility, CountyAbility]
      end
    end
  end
end

Spree::Ability.prepend(Cenabast::Spree::AbilityDecorator)
