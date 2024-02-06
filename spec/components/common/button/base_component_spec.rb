# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Button::BaseComponent, type: :component do
  it 'renders component' do
    render_preview(:standard, params: { text: 'Testing' })

    expect(page).to have_button 'Testing'
  end

  # Sizes

  it 'renders component on size sm' do
    render_preview(:standard, params: { size: 'sm' })

    expect(page).to have_css '.text-sm.min-w-\[106px\].min-h-\[36px\]'
  end

  it 'renders component on size md' do
    render_preview(:standard, params: { size: 'md' })

    expect(page).to have_css '.text-sm.min-w-\[110px\].min-h-\[40px\]'
  end

  it 'renders component on size lg' do
    render_preview(:standard, params: { size: 'lg' })

    expect(page).to have_css '.text-base.min-w-\[125px\].min-h-\[44px\]'
  end

  it 'renders component on size xl' do
    render_preview(:standard, params: { size: 'xl' })

    expect(page).to have_css '.text-base.min-w-\[129px\].min-h-\[48px\]'
  end

  it 'renders component on size xxl' do
    render_preview(:standard, params: { size: 'xxl' })

    expect(page).to have_css '.text-lg.min-w-\[156px\].min-h-\[60px\]'
  end

  # Hierarchy

  it 'renders component with hierarchy primary' do
    render_preview(:standard, params: { hierarchy: 'primary' })

    expect(page).to have_css '.bg-primary-600'
  end

  it 'renders component with hierarchy secondary_color' do
    render_preview(:standard, params: { hierarchy: 'secondary_color' })

    expect(page).to have_css '.bg-primary-50.text-primary-700'
  end

  it 'renders component with hierarchy secondary_gray' do
    render_preview(:standard, params: { hierarchy: 'secondary_gray' })

    expect(page).to have_css '.border-gray-300.bg-white.text-gray-700'
  end

  it 'renders component with hierarchy tertiary_color' do
    render_preview(:standard, params: { hierarchy: 'tertiary_color' })

    expect(page).to have_css '.bg-white.text-primary-700'
  end

  it 'renders component with hierarchy tertiary_gray' do
    render_preview(:standard, params: { hierarchy: 'tertiary_gray' })

    expect(page).to have_css '.bg-white.text-gray-500'
  end

  it 'renders component with hierarchy link_color' do
    render_preview(:standard, params: { hierarchy: 'link_color' })

    expect(page).to have_css '.text-primary-700'
  end

  it 'renders component with hierarchy link_gray' do
    render_preview(:standard, params: { hierarchy: 'link_gray' })

    expect(page).to have_css '.text-gray-500'
  end

  # Desructive

  it 'renders component with hierarchy primary and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'primary', destructive: true })

    expect(page).to have_css '.bg-error-600.text-white'
  end

  it 'renders component with hierarchy secondary_color and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'secondary_color', destructive: true })

    expect(page).to have_css '.bg-error-50.text-error-700'
  end

  it 'renders component with hierarchy secondary_gray and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'secondary_gray', destructive: true })

    expect(page).to have_css '.bg-error-300.text-error-700'
  end

  it 'renders component with hierarchy tertiary_color and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'tertiary_color', destructive: true })

    expect(page).to have_css '.text-error-700'
  end

  it 'renders component with hierarchy tertiary_gray and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'tertiary_gray', destructive: true })

    expect(page).to have_css '.text-error-700'
  end

  it 'renders component with hierarchy link_color and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'link_color', destructive: true })

    expect(page).to have_css '.text-error-700'
  end

  it 'renders component with hierarchy link_gray and destructive syles' do
    render_preview(:standard, params: { hierarchy: 'link_gray', destructive: true })

    expect(page).to have_css '.text-error-700'
  end
end
