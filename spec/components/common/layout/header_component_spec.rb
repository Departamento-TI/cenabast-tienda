# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Layout::HeaderComponent, type: :component do
  it 'renders component' do
    categories = create_list(:taxonomy, 3)

    render_preview(:standard)

    expect(page).to have_selector('[role="gray-picker-component"]', count: 3)

    expect(page).to have_selector '[role="header-logo"]'
    expect(page).to have_selector '[role="profile-component"]'

    categories.each do |category|
      expect(page).to have_link(category.name)
    end

    expect(page).to have_selector '[role="cart-button-container"]'
    expect(page).to have_link(href: spree.cart_path)

    expect(page).to have_selector '[role="searchbar"]'
  end
end
