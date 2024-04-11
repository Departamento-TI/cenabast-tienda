# frozen_string_literal: true

class Order::Checkout::Step::AddressFormComponentPreview < ViewComponent::Preview
  # @param order_substep select { choices: [0, 1] }
  def default(order_substep: '0')
    render Order::Checkout::Step::AddressFormComponent.new(
      order: Spree::Order.new(order_substep: order_substep.to_i)
    )
  end
end
