# frozen_string_literal: true

class Order::Checkout::HeaderComponentPreview < ViewComponent::Preview
  # @param subtotal text
  # @param total text
  def default(subtotal: '$500.500', total: '$500.500')
    render Order::Checkout::HeaderComponent.new(
      subtotal:,
      total:
    )
  end
end
