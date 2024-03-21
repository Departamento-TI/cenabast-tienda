# frozen_string_literal: true

class Order::Cart::ListComponentPreview < ViewComponent::Preview
  def default
    render Order::Cart::ListComponent.new(line_items:)
  end

  private

  def line_items # rubocop:disable Metrics/MethodLength
    [
      {
        id: 1,
        index: 1,
        dom_id: 'test1',
        price: Spree::Money.new(1200, currency: 'CLP'),
        quantity: 2,
        total: Spree::Money.new(2400, currency: 'CLP'),
        name: 'BACTEROL FORTE 160/800 CAJ 1000 CM',
        vendor_name: 'LABORATORIOS LAFI LTDA',
        product_url: '/products/test-url',
        product_image_url: 'noimage/backend-missing-image.svg'
      },
      {
        id: 2,
        index: 2,
        dom_id: 'test2',
        price: Spree::Money.new(2400, currency: 'CLP'),
        quantity: 3, total: Spree::Money.new(7200, currency: 'CLP'),
        name: 'AGUJA P/EXTRACCION SANGR 21 G CAJ 100 UN',
        vendor_name: 'MEDICAL FRONT SPA',
        product_url: '/products/test-url',
        product_image_url: 'noimage/backend-missing-image.svg'
      },
      {
        id: 3,
        index: 3,
        dom_id: 'test3',
        price: Spree::Money.new(3600, currency: 'CLP'),
        quantity: 4,
        total: Spree::Money.new(14_400, currency: 'CLP'),
        name: 'CLOPIVITAE 75 MG CAJ 28 CM REC',
        vendor_name: 'MEDICAL FRONT SPA',
        product_url: '/products/test-url',
        product_image_url: 'noimage/backend-missing-image.svg'
      },
      {
        id: 4,
        index: 4,
        dom_id: 'test4',
        price: Spree::Money.new(2000, currency: 'CLP'),
        quantity: 4,
        total: Spree::Money.new(8000, currency: 'CLP'),
        name: 'CLOXACILINA 500 MG CAJ 12 CP',
        vendor_name: 'ARAMA NATURAL PRODUCTS DISTRIBUIDOR',
        product_url: '/products/test-url',
        product_image_url: 'noimage/backend-missing-image.svg'
      },
      {
        id: 5,
        index: 5,
        dom_id: 'test5',
        price: Spree::Money.new(21_000, currency: 'CLP'),
        quantity: 10,
        total: Spree::Money.new(210_000, currency: 'CLP'),
        name: 'DACTINOMICINA 0,5 MG LIOF. CAJ 1 FAM',
        vendor_name: 'BPH S.A.',
        product_url: '/products/test-url',
        product_image_url: 'noimage/backend-missing-image.svg'
      }
    ]
  end
end
