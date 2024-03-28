module Cenabast
  module Spree
    module StoreDecorator
      module ClassMethods
        def intermediacion
          find_by(code: 'spree-intermediation')
        end

        def ecommerce
          find_by(code: 'spree-ecommerce')
        end
      end

      def self.prepended(base)
        class << base
          prepend ClassMethods
        end

        base.typed_store :settings, coder: ActiveRecord::TypedStore::IdentityCoder do |s|
          # Cenabast per vendor cart amount limitation
          s.integer :limit_cart_amount_utm, default: 4, null: false
          s.float   :current_utm_value, default: 64_793, null: false
        end
      end
    end
  end
end

not_included = Spree::Store.included_modules.exclude?(Cenabast::Spree::StoreDecorator)
Spree::Store.prepend Cenabast::Spree::StoreDecorator if not_included
