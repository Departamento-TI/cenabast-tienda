module Cenabast
  module Spree
    module StateDecorator
      def self.prepended(base)
        base.has_many :counties, -> { order('name ASC') }, inverse_of: 'state', dependent: :destroy
      end
    end
  end
end

not_included = Spree::State.included_modules.exclude?(Cenabast::Spree::StateDecorator)
Spree::State.prepend Cenabast::Spree::StateDecorator if not_included
