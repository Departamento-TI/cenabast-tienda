module Cenabast
  module Spree
    module ClassificationDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasDependantDestroyAttributesJsonApi
      end
    end
  end
end

not_included = Spree::Classification.included_modules.exclude?(Cenabast::Spree::ClassificationDecorator)
Spree::Classification.prepend Cenabast::Spree::ClassificationDecorator if not_included
