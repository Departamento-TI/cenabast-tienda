require 'rails_helper'

RSpec.describe 'Visiting Product Page', type: :system do
  let(:receiver) { create(:receiver) }
  let(:user) { create(:user, receivers: [receiver]) }
  let(:generic_product) { create(:generic_product) }
  let(:product) { create(:cenabast_product, generic_product:, price: 5_555) }

  before(:each) do
    create_cenabast_stores
    store = Spree::Store.first
    store.update(default: true)
    act_with_current_store(store)

    act_as_logged_in(user)
    user.toggle_receiver(receiver)
    user.toggle_store(store)
  end

  context 'product in stock' do
    before(:each) do
      product.stock_items.each { |s| s.update(count_on_hand: 10, backorderable: false) }

      visit "/products/#{product.slug}"
    end

    it 'should display product`s generic product name' do
      expect(page).to have_text(product.generic_product.name)
    end

    it 'should display product`s generic product ATC code' do
      expect(page).to have_text(product.generic_product.code_atc)
    end

    it 'should display product`s generic product ZGEN code' do
      expect(page).to have_text(product.generic_product.code)
    end

    it 'should display product`s contract ZCEN code' do
      expect(page).to have_text(product.contract.code)
    end

    it 'should display product`s price on chilean format' do
      expect(page).to have_text('$5.555')
    end

    it 'should have link to mercado publico licitation page' do
      url = "https://www.mercadopublico.cl/Procurement/Modules/RFB/DetailsAcquisition.aspx?idlicitacion=#{product.contract.mercado_publico_id}"
      expect(page).to have_link(product.contract.mercado_publico_id, href: url)
    end

    it 'should display that is in stock', js: true do
      expect(page).to have_text(Spree.t(:in_stock).upcase)
    end

    it 'should not have add to cart button enabled', js: true do
      expect(page).to have_selector('#add-to-cart-button')
    end
  end

  context 'product is out of stock' do
    before(:each) do
      product.stock_items.each { |s| s.update(count_on_hand: 0, backorderable: false) }

      visit "/products/#{product.slug}"
    end

    it 'should display that is out of stock', js: true do
      expect(page).to have_text(Spree.t(:out_of_stock).upcase)
    end

    it 'should not have add to cart button enabled', js: true do
      expect(page).to_not have_selector('#add-to-cart-button')
    end
  end

  context 'product is discontinued' do
    before(:each) do
      product.update(discontinue_on: 3.days.ago)

      visit "/products/#{product.slug}"
    end

    it 'should display that is out of stock', js: true do
      expect(page).to have_text(Spree.t(:out_of_stock).upcase)
    end

    it 'should not have add to cart button enabled', js: true do
      expect(page).to_not have_selector('#add-to-cart-button[enabled]')
    end
  end
end
