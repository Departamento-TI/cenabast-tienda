# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::ListComponent, type: :component do
  it 'should render default component' do
    create_list(:base_product, 8)
    render_preview(:list_with_result_and_pagination)

    expect(page).to have_css('div[id^="product_"]', count: 8)
    expect(page).to have_css('img.product-component-image', count: 8)
    expect(page).to have_button('Agregar', count: 8)
  end
end
