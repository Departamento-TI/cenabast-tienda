module Cenabast
  module Spree
    module Stock
      module PackageDecorator
        # This method is decorated by the spree_multi_vendor gem
        # https://github.com/spree-contrib/spree_multi_vendor/blob/main/app/models/spree_multi_vendor/spree/stock/package_decorator.rb
        # We dont really need at the moment shipping methods based on vendor, so the change is reverted
        def shipping_methods
          shipping_categories.includes(:shipping_methods).map(&:shipping_methods).reduce(:&).to_a
        end
      end
    end
  end
end

not_included = Spree::Stock::Package.included_modules.exclude?(Cenabast::Spree::Stock::PackageDecorator)
Spree::Stock::Package.prepend Cenabast::Spree::Stock::PackageDecorator if not_included
