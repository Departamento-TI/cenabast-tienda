require 'rails_helper'

RSpec.describe 'Visiting Product Page', type: :system do
  let(:receiver) { create(:receiver) }
  let(:user) { create(:user, receivers: [receiver]) }
  let(:product) { create(:cenabast_product) }

  before(:each) do
    create_cenabast_stores
    store = Spree::Store.first
    store.update(default: true)
    act_with_current_store(store)

    act_as_logged_in(user)
    user.toggle_receiver(receiver)
    user.toggle_store(store)

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

  it 'should have link to mercado publico licitation page' do
    url = "https://www.mercadopublico.cl/Procurement/Modules/RFB/DetailsAcquisition.aspx?idlicitacion=#{product.contract.mercado_publico_id}"
    expect(page).to have_link(product.contract.mercado_publico_id, href: url)
  end
end
