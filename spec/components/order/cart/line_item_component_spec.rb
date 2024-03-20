# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order::Cart::LineItemComponent, type: :component do
  it 'renders component' do
    render_preview(:default, params: { name: 'Testing name', price: 123_123, quantity: 3 })

    expect(page).to have_selector('[role="line-item-name"]')
    expect(page).to have_selector('[role="line-item-vendor-name"]')
    expect(page).to have_selector('[role="line-item-price"]')
    expect(page).to have_selector('[role="line-item-total"]')
    expect(page).to have_selector('[role="line-item-quantity"]')
    expect(page).to have_selector('[role="line-item-delete"]')

    title_container = page.find('[role="line-item-name"]')
    expect(title_container).to have_content 'Testing name'

    expect(page.find('[role="line-item-quantity"]').value).to eq '3'

    quantity_container = page.find('[role="line-item-price"]')
    expect(quantity_container).to have_content '$123,123'

    expect(page).to have_link(href: '#')
  end
end
