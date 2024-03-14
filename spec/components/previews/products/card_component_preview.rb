# frozen_string_literal: true

class Products::CardComponentPreview < ViewComponent::Preview
  def default
    product = Spree::Product.first
    product_data = {
      id: product.id,
      name: product.name,
      description: product.description,
      image: image_tag('noimage/plp.png', class: 'product-component-image', height: '371', width: '278'),
      price: '$19.990',
      vendor_name: product.vendor&.name,
      url: Spree::Core::Engine.routes.url_helpers.product_path(product, taxon_id: product.taxons.first&.id),
    }
    render(Products::CardComponent.new(product_data:, cache_key: nil))
  end
end
