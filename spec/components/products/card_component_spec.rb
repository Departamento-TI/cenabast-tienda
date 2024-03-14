# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::CardComponent, type: :component do
  it 'should render default component' do
    product = create(:base_product)
    render_preview(:default)

    expect(page).to have_selector('div', id: "product_#{product.id}")
    expect(page).to have_content(product.name)
    expect(page).to have_css('img.product-component-image')
    expect(page).to have_selector(:link_or_button, 'Agregar')
  end
end
