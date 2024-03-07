module Cenabast
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_one :contract, class_name: 'Cenabast::Spree::Contract', dependent: :destroy
        base.belongs_to :generic_product, class_name: 'Cenabast::Spree::GenericProduct'

        base.accepts_nested_attributes_for :store_products, allow_destroy: true
        base.accepts_nested_attributes_for :classifications, allow_destroy: true
      end
    end
  end
end

not_included = Spree::Product.included_modules.exclude?(Cenabast::Spree::ProductDecorator)
Spree::Product.prepend Cenabast::Spree::ProductDecorator if not_included
