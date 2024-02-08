# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Layout::Header::GrayPickerComponent, type: :component do
  it 'renders component' do
    render_preview(:standard, params: { title: 'Testing', value: 'Pick Test value' })

    title_span = page.find('button > span.font-semibold')
    expect(title_span).to have_content 'Testing'

    expect(page).to have_content 'Pick Test value'
  end

  it 'renders dropdown menu' do
    render_preview(:standard)

    expect(page).to have_css '.dropdown-menu'
    expect(page).to have_selector('.dropdown-menu form', count: 3)
  end
end
