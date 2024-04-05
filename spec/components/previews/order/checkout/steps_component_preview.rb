# frozen_string_literal: true

class Order::Checkout::StepsComponentPreview < ViewComponent::Preview
  # @param state select { choices: [address, delivery] }
  # @param order_substep select { choices: [0, 1] }
  def default(state: 'address', order_substep: '0')
    bill_address_data = {
      address: 'SS Met Sur Oriente',
      run: 'RUT 61.608.500 - K'
    }

    ship_address_data = {
      address: 'Posta La Puntilla',
      run: 'RUT 61.608.500 - K'
    }

    render Order::Checkout::StepsComponent.new(
      state:,
      order_substep:,
      bill_address_data:,
      ship_address_data:
    )
  end
end
