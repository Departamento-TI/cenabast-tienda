# frozen_string_literal: true

class Order::Checkout::Step::DeliveryFormComponentPreview < ViewComponent::Preview
  # @param order_substep select { choices: [0, 1] }
  def default(order_substep: '0')
    order = mock_order(order_substep)
    order.shipments = [mock_shipment]
    render Order::Checkout::Step::DeliveryFormComponent.new(order:)
  end

  private

  def mock_order(order_substep)
    struct_order = Struct.new(:order_substep, :currency, :shipments, :confirm?)

    struct_order.new(order_substep: order_substep.to_i, currency: 'CLP', confirm?: false)
  end

  def mock_shipment
    struct_shipment = Struct.new(:id, :cost, :selected_shipping_rate_id, :shipping_rates, :stock_location)
    struct_shipping_rate = Struct.new(:id, :name, :display_cost, :shipping_method)
    struct_shipping_method = Struct.new(:name)
    struct_stock_location = Struct.new(:vendor)
    struct_vendor = Struct.new(:name)

    struct_shipment.new(
      id: 2,
      cost: 0,
      selected_shipping_rate_id: 8,
      shipping_rates: [struct_shipping_rate.new(
        id: 8,
        name: 'Despacho Gratis',
        display_cost: '$0',
        shipping_method: struct_shipping_method.new(
          name: 'Despacho Gratis'
        )
      )],
      stock_location: struct_stock_location.new(
        vendor: struct_vendor.new(
          name: 'Laboratorio Acid'
        )
      )
    )
  end
end
