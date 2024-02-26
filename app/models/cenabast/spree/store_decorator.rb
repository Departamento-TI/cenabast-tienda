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
      end
    end
  end
end

not_included = Spree::Store.included_modules.exclude?(Cenabast::Spree::StoreDecorator)
Spree::Store.prepend Cenabast::Spree::StoreDecorator if not_included
