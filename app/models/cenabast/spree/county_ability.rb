module Cenabast
  module Spree
    class CountyAbility
      include CanCan::Ability

      def initialize(user)
        user ||= Spree::User.new

        can [:index, :read], ::Spree::County unless user.has_spree_role? 'admin'
      end
    end
  end
end
