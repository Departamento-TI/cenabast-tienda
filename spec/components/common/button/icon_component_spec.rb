# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Button::IconComponent, type: :component do
  it 'renders component' do
    render_preview(:standard, params: { text: 'Testing' })

    expect(page).to have_button 'Testing'
  end

  # Icon

  it 'renders component with trailing icon' do
    render_preview(:standard, params: { icon: 'trailing' })

    expect(page).to have_css '.float-right.ml-2'
  end

  it 'renders component with leading icon' do
    render_preview(:standard, params: { icon: 'leading' })

    expect(page).to have_css '.float-left.mr-2'
  end

  # Sizes

  it 'renders component icon on size sm' do
    render_preview(:standard, params: { size: 'sm' })

    expect(page).to have_css '.w-\[20px\].h-\[20px\]'
  end

  it 'renders component icon on size md' do
    render_preview(:standard, params: { size: 'md' })

    expect(page).to have_css '.w-\[20px\].h-\[20px\]'
  end

  it 'renders component icon on size lg' do
    render_preview(:standard, params: { size: 'lg' })

    expect(page).to have_css '.w-\[20px\].h-\[20px\]'
  end

  it 'renders component icon on size xl' do
    render_preview(:standard, params: { size: 'xl' })

    expect(page).to have_css '.w-\[20px\].h-\[20px\]'
  end

  it 'renders component icon on size xxl' do
    render_preview(:standard, params: { size: 'xxl' })

    expect(page).to have_css '.w-\[24px\].h-\[24px\]'
  end
end
