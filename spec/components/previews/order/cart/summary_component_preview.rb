# frozen_string_literal: true

class Order::Cart::SummaryComponentPreview < ViewComponent::Preview
  def default
    render Order::Cart::SummaryComponent.new(total: 120_000, stats_per_vendor:)
  end

  private

  def stats_per_vendor
    [
      {
        vendor_id: 1,
        vendor_name: 'BPH S.A.',
        subtotal: 23_000
      },
      {
        vendor_id: 2,
        vendor_name: nil,
        subtotal: 23_000
      },
      {
        vendor_id: 3,
        vendor_name: 'ARAMA NATURAL PRODUCTS DISTRIBUIDOR',
        subtotal: 74_000
      }
    ]
  end
end
