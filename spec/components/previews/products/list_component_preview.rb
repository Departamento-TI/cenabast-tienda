# frozen_string_literal: true

class Products::ListComponentPreview < ViewComponent::Preview
  include Spree::FrontendHelper
  include Kaminari::Helpers::HelperMethods

  def list_with_result_and_pagination
    products = Spree::Product.page(1).per(8)

    render(Products::ListComponent.new(cache_key: nil)) do |component|
      products.each do |product|
        component.with_product do
          Products::CardComponent.new(
            product_data: {
              id: product.id,
              name: product.name,
              description: product.description,
              image: plp_and_carousel_image(product, 'product-component-plp-image'),
              price: '$19.990',
              vendor_name: product.vendor&.name,
              url: Spree::Core::Engine.routes.url_helpers.product_path(product, taxon_id: product.taxons.first&.id),
            },
            cache_key: nil
          ).render_in(component)
        end
      end
    end
  end
end
