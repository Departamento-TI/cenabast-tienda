# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Layout::MainCategoriesComponent, type: :component do
  it 'renders component' do
    render_preview(:with_categories, params: { items_quantity: 4 })

    expect(page).to have_link(count: 4)
    4.times do |index|
      expect(page).to have_link("Name #{index + 1}")
    end
  end
end
