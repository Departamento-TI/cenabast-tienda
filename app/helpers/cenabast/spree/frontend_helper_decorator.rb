module Cenabast
  module Spree
    module FrontendHelperDecorator
      def cart_product_image_url(variant)
        image = default_image_for_product_or_variant(variant)
        image ? main_app.cdn_image_url(image.url(:small)) : asset_path('noimage/small.png')
      end

      def logo(image_path = nil, options = {})
        logo_attachment = if defined?(::Spree::StoreLogo) && current_store.logo.is_a?(::Spree::StoreLogo)
                            current_store.logo.attachment # Spree v5
                          else
                            current_store.logo # Spree 4.x
                          end

        image_path ||= logo_path(logo_attachment)

        path = spree.respond_to?(:root_path) ? spree.root_path : main_app.root_path

        link_to path, 'aria-label': current_store.name, method: options[:method] do
          image_tag image_path, alt: current_store.name, title: current_store.name
        end
      end

      private

      def logo_path(logo_attachment)
        if logo_attachment&.attached? && logo_attachment&.variable?
          # fix ruby-vips TypeError (no implicit conversion to float from string) when resize image.
          # https://github.com/libvips/ruby-vips/issues/236
          main_app.cdn_image_url(logo_attachment.variant(resize_to_fit: [400, nil]))
        elsif logo_attachment&.attached? && logo_attachment&.image?
          main_app.cdn_image_url(current_store.logo)
        else
          asset_path('logo/spree_50.png')
        end
      end
    end
  end
end

def decorator_excluded?
  Spree::FrontendHelper.included_modules.exclude?(Cenabast::Spree::FrontendHelperDecorator)
end
Spree::FrontendHelper.prepend(Cenabast::Spree::FrontendHelperDecorator) if decorator_excluded?
