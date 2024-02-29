module Cenabast
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_one :contract, class_name: 'Cenabast::Spree::Contract', dependent: :destroy
        base.belongs_to :generic_product, class_name: 'Cenabast::Spree::GenericProduct'
      end
    end
  end
end

not_included = Spree::Product.included_modules.exclude?(Cenabast::Spree::ProductDecorator)
Spree::Product.prepend Cenabast::Spree::ProductDecorator if not_included
