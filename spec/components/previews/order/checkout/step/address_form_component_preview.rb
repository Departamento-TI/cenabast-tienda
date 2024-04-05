# frozen_string_literal: true

class Order::Checkout::Step::AddressFormComponentPreview < ViewComponent::Preview
  def default
    render Order::Checkout::Step::AddressFormComponent.new(
      order: nil
    )
  end
end
