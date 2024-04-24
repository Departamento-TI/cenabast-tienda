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

        base.searchkick

        base.has_one :contract, class_name: 'Cenabast::Spree::Contract', dependent: :destroy
        base.belongs_to :generic_product, class_name: 'Cenabast::Spree::GenericProduct'

        base.accepts_nested_attributes_for :store_products, allow_destroy: true
        base.accepts_nested_attributes_for :classifications, allow_destroy: true
      end

      def option_value_ids
        variants.map { |v| v.option_values.map(&:id) }
      end

      def search_data
        data = respond_to?(:to_hash) ? to_hash : serializable_hash
        data.delete('id')
        data.delete('_id')
        data.delete('_type')
        data.merge(
          {
            zcen: contract&.code,
            name_zcen: contract&.name,
            zgen: generic_product&.code,
            name_zgen: generic_product&.name,
            taxon_ids:,
            currency:,
            price:,
            option_value_ids:,
            store_ids:
          }
        )
      end
    end
  end
end

not_included = Spree::Product.included_modules.exclude?(Cenabast::Spree::ProductDecorator)
Spree::Product.prepend Cenabast::Spree::ProductDecorator if not_included
