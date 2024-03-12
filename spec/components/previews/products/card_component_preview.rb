# frozen_string_literal: true

class Products::CardComponentPreview < ViewComponent::Preview
  include Spree::FrontendHelper

  def default
    product = Spree::Product.first
    product_data = {
      id: product.id,
      name: product.name,
      description: product.description,
      image: plp_and_carousel_image(product, 'product-component-plp-image'),
      price: '$19.990',
      vendor_name: product.vendor&.name,
      url: Spree::Core::Engine.routes.url_helpers.product_path(product, taxon_id: product.taxons.first&.id),
    }
    render(Products::CardComponent.new(product_data:, cache_key: nil))
  end
end
