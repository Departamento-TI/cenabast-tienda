module Cenabast
  module Spree
    module ProductsFiltersHelperDecorator
      def price_filters
        @price_filters ||= [
          filters_less_than_price_range(1000),
          filters_price_range(1000, 5000),
          filters_price_range(5000, 10_000),
          filters_price_range(10_000, 20_000),
          filters_price_range(20_000, 50_000),
          filters_more_than_price_range(50_000)
        ]
      end
    end
  end
end

def decorator_excluded?
  Spree::ProductsFiltersHelper.included_modules.exclude?(Cenabast::Spree::ProductsFiltersHelperDecorator)
end
Spree::ProductsFiltersHelper.prepend(Cenabast::Spree::ProductsFiltersHelperDecorator) if decorator_excluded?
