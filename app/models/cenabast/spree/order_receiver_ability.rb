module Cenabast
  module Spree
    class OrderReceiverAbility
      include CanCan::Ability

      def initialize(user)
        can :update, Spree::Order do |order, token|
          !order.completed? && (order.receiver == user.current_receiver || (order.token && token == order.token))
        end
      end
    end
  end
end
