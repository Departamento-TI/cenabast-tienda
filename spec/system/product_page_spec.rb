require 'rails_helper'

RSpec.describe 'Visiting Product Page', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:cenabast_product) }

  before do
    puts product.stores.pluck(:name)
    act_as_logged_in(user)
    visit "/products/#{product.slug}"
  end

  xit 'shows product' do
    expect(page).to have_text(Spree.t('spree.pdp.about_product'))
  end

  xit 'should display product`s ATC code' do
    expect(page).to have_text(product.generic_product.code_atc)
  end
end
