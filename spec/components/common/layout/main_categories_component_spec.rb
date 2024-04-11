# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Layout::MainCategoriesComponent, type: :component do
  it 'renders component' do
    categories = create_list(:taxonomy, 3)

    render_preview(:with_categories)

    expect(page).to have_link(count: categories.count)
    categories.each do |category|
      expect(page).to have_link(category.name)
    end
  end
end
