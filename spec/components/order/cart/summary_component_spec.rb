# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order::Cart::SummaryComponent, type: :component do
  it 'renders component' do
    render_preview(:default)

    expect(page).to have_selector('[role="summary-vendor-name"]', count: 3)
    expect(page).to have_selector('[role="summary-subtotal"]', count: 3)
    expect(page).to have_selector('[role="summary-total"]', count: 1)

    expect(page).to have_content Spree.t(:order_total)

    expect(page).to have_link(text: Spree.t(:send_order), href: spree.checkout_path)
  end
end
