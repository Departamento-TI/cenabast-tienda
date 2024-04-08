# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order::Checkout::HeaderComponent, type: :component do
  let(:subtotal) { rand(20_000..30_000) }
  let(:total) { rand(20_000..30_000) }

  it 'renders component' do
    render_preview(:default, params: { subtotal:, total: })

    expect(page).to have_selector('[role="checkout-header"]', count: 1)
    expect(page).to have_selector('[role="checkout-header-title"]', count: 1)
    expect(page).to have_selector('[role="checkout-header-description"]', count: 1)
    expect(page).to have_selector('[role="checkout-header-subtotal"]', count: 1)
    expect(page).to have_selector('[role="checkout-header-total"]', count: 1)

    expect(page).to have_content Spree.t('checkout_page.subtotal')
    expect(page).to have_content Spree.t('checkout_page.order_total')

    subtotal_container = page.find('[role="checkout-header-subtotal"]')
    expect(subtotal_container).to have_content subtotal

    total_container = page.find('[role="checkout-header-total"]')
    expect(total_container).to have_content total
  end
end
