# frozen_string_literal: true

class Products::ListComponentPreview < ViewComponent::Preview
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
              image: image_tag('noimage/plp.png', class: 'product-component-image', height: '371', width: '278'),
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
