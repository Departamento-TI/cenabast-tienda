# frozen_string_literal: true

class Order::Cart::LineItemComponentPreview < ViewComponent::Preview
  def default
    render Order::Cart::LineItemComponent.new(line_item:)
  end

  private

  def line_item
    {
      id: 1,
      price: Spree::Money.new(1200, currency: 'CLP'),
      quantity: 2,
      total: Spree::Money.new(2400, currency: 'CLP'),
      name: 'BACTEROL FORTE 160/800 CAJ 1000 CM',
      vendor_name: 'LABORATORIOS LAFI LTDA',
      product_url: '/products/test-url',
      product_image_url: image_url('noimage/backend-missing-image.svg')
    }
  end
end
