# frozen_string_literal: true

class Order::Cart::LineItemComponentPreview < ViewComponent::Preview
  # @param name text
  # @param price number
  # @param total number
  # @param quantity number
  def default(name: 'Line Item Test', price: 1200, total: 2400, quantity: 2)
    line_item = build_line_item
    line_item[:name] = name
    line_item[:price] = Spree::Money.new(price, currency: 'CLP')
    line_item[:total] = Spree::Money.new(total, currency: 'CLP')
    line_item[:quantity] = quantity

    render Order::Cart::LineItemComponent.new(line_item:)
  end

  private

  def build_line_item
    {
      id: 1,
      index: 1,
      dom_id: 'test',
      price: Spree::Money.new(1200, currency: 'CLP'),
      quantity: 2,
      total: Spree::Money.new(2400, currency: 'CLP'),
      name: 'BACTEROL FORTE 160/800 CAJ 1000 CM',
      vendor_name: 'LABORATORIOS LAFI LTDA',
      product_url: '/products/test-url',
      product_image_url: 'noimage/backend-missing-image.svg'
    }
  end
end
