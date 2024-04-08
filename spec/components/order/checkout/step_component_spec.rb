# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order::Checkout::StepComponent, type: :component do
  let(:title) { Faker::Alphanumeric.alpha(number: 10) }
  let(:format) { nil }
  let(:active) { false }
  let(:enabled_link) { false }
  let(:details) { [] }
  let(:component_params) do
    {
      title:,
      format:,
      active:,
      enabled_link:,
      action_url: '#',
      details:
    }
  end

  describe 'format is big' do
    let(:format) { 'big' }

    it 'renders component' do
      render_preview(:default, params: component_params)

      expect(page).to have_selector('[role="step-component-header"]', count: 1)
      expect(page).to have_selector('[role="step-component-title"]', count: 1)

      title_container = page.find('[role="step-component-title"]')
      expect(title_container).to have_content title
    end

    describe 'has details' do
      let(:details) { Array.new(rand(2..4)) { |_| Faker::Alphanumeric.alpha(number: 10) } }

      it 'will show details' do
        render_preview(:default, params: component_params)

        expect(page).to have_selector('[role="step-component-details"]', count: 1)
        expect(page).to have_selector('[role="step-component-detail"]', count: details.count)
      end
    end
  end

  describe 'format is small' do
    let(:format) { 'small' }

    it 'renders component' do
      render_preview(:default, params: component_params)

      expect(page).to have_selector('[role="step-component-header"]', count: 1)
      expect(page).to have_selector('[role="step-component-title"]', count: 1)

      title_container = page.find('[role="step-component-title"]')
      expect(title_container).to have_content title
    end

    describe 'has details' do
      let(:details) { Array.new(rand(2..4)) { |_| Faker::Alphanumeric.alpha(number: 10) } }

      it 'will not show details' do
        render_preview(:default, params: component_params)

        expect(page).to have_selector('[role="step-component-details"]', count: 0)
        expect(page).to have_selector('[role="step-component-detail"]', count: 0)
      end
    end
  end

  describe 'is not active' do
    let(:active) { false }
    let(:format) { 'big' }
    let(:details) { Array.new(rand(2..4)) { |_| Faker::Alphanumeric.alpha(number: 10) } }

    it 'renders inactive css classes' do
      render_preview(:default, params: component_params)

      header_selector = <<-STYLE
        div .item-cart-parent .mx-auto .p-0 .maw-w-full .max-h-full
        .bg-white .rounded-lg .border .shadow-sm .font-medium
        .text-left .flex .flex-col .border-gray-200
      STYLE
      expect(page).to have_css(header_selector.delete("\n "))

      expect(page).to have_css('[role="step-component-header"].m-3.px-2.flex.flex-row.text-gray-500')
      expect(page).to have_css('[role="step-component-details"].m-3.px-2.text-gray-400.text-sm.flex.flex-col')
    end
  end

  describe 'is not active' do
    let(:active) { true }
    let(:format) { 'big' }
    let(:details) { Array.new(rand(2..4)) { |_| Faker::Alphanumeric.alpha(number: 10) } }

    it 'renders active css classes' do
      render_preview(:default, params: component_params)

      header_selector = <<-STYLE
        div .item-cart-parent .mx-auto .p-0 .maw-w-full .max-h-full .bg-white .rounded-lg
        .border .shadow-sm .font-medium .text-left
        .flex .flex-col .border-primary-600
      STYLE

      expect(page).to have_css(header_selector.delete("\n "))

      expect(page).to have_css('[role="step-component-header"].m-3.px-2.flex.flex-row.text-primary-700')
      expect(page).to have_css('[role="step-component-details"].m-3.px-2.text-gray-700.text-sm.flex.flex-col')
    end
  end
end
