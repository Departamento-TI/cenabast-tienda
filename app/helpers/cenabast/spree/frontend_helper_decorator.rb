module Cenabast
  module Spree
    module FrontendHelperDecorator
      def cart_product_image_url(variant)
        image = default_image_for_product_or_variant(variant)
        image ? main_app.cdn_image_url(image.url(:small)) : asset_path('noimage/small.png')
      end
    end
  end
end

def decorator_excluded?
  Spree::FrontendHelper.included_modules.exclude?(Cenabast::Spree::FrontendHelperDecorator)
end
Spree::FrontendHelper.prepend(Cenabast::Spree::FrontendHelperDecorator) if decorator_excluded?
