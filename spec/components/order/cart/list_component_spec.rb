# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order::Cart::ListComponent, type: :component do
  it 'renders component' do
    render_preview(:default)

    expect(page).to have_selector('[role="list-title"]')
    expect(page).to have_selector('[role="list-vendor-line-items-container"]', count: 4)
    expect(page).to have_selector('[role="line-item-container"]', count: 5)

    expect(page).to have_content Spree.t(:cart)
  end
end
