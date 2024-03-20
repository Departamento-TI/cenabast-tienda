module Cenabast
  module Spree
    module ProductDecorator
      module ClassMethods
        def json_api_permitted_attributes
          super + ['sku', 'status']
        end
      end

      def self.prepended(base)
        class << base
          prepend ClassMethods
        end

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
