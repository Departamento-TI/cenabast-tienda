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

    puts product.stores.pluck(:name)
    act_as_logged_in(user)
    user.toggle_receiver(receiver)
    user.toggle_store(store)

    visit "/products/#{product.slug}"
  end

  it 'should display product`s ATC code', js: true do
    expect(page).to have_text(product.generic_product.code_atc)
  end
end
