require 'rails_helper'

RSpec.describe 'Product search features', type: :system, search: true do
  let(:receiver) { create(:receiver) }
  let(:user) { create(:user, receivers: [receiver]) }

  before(:each) do
    create_cenabast_stores
    @store = Spree::Store.first
    @store.update(default: true)
    act_with_current_store(@store)

    act_as_logged_in(user)
    user.toggle_receiver(receiver)
    user.toggle_store(@store)

    visit '/'
  end

  RSpec.shared_examples 'has product search information' do
    before(:each) do
      Spree::Product.reindex
      fill_in Spree.t(:search), with: "#{keywords}\n"
    end

    it 'should display one result' do
      expect(page).to have_text "#{match_product_count} #{Spree.t('plp.results_for')} '#{keywords.upcase}'"
    end

    it 'should display product`s name' do
      expect(page).to have_text(product.name)
    end

    it 'should display product`s manufacturer name' do
      expect(page).to have_text(product.vendor.name)
    end

    it 'should display product`s price' do
      expect(page).to have_text(product.display_price)
    end
  end

  context 'Searching by ZGEN' do
    let!(:vendor) { create(:vendor) }
    let!(:generic_product) { create(:generic_product, code: 'test12345') }
    let!(:product) { create(:cenabast_product, vendor:, generic_product:) }
    let!(:keywords) { generic_product.code }
    let!(:match_product_count) { 1 }

    include_examples 'has product search information'
  end

  context 'Searching by ZGEN name' do
    let!(:vendor) { create(:vendor) }
    let!(:generic_product) { create(:generic_product, name: 'Cenabast-name-test12345') }
    let!(:product) { create(:cenabast_product, vendor:, generic_product:) }
    let!(:keywords) { generic_product.name }
    let!(:match_product_count) { 1 }

    include_examples 'has product search information'
  end

  context 'Searching by ZCEN' do
    let!(:vendor) { create(:vendor) }
    let!(:contract) { create(:contract, code: 'zcencenabast3888') }
    let!(:product) { create(:cenabast_product, vendor:, contract:) }
    let!(:keywords) { contract.code }
    let!(:match_product_count) { 1 }

    include_examples 'has product search information'
  end

  context 'Searching by ZCEN name' do
    let!(:vendor) { create(:vendor) }
    let!(:contract) { create(:contract, name: 'product-contract-name') }
    let!(:product) { create(:cenabast_product, vendor:, contract:) }
    let!(:keywords) { contract.name }
    let!(:match_product_count) { 1 }

    include_examples 'has product search information'
  end

  context 'ignoring other products, matching those that only have the ZGEN code root' do
    let!(:keywords) { 'AXIQND' }
    let!(:match_product_count) { rand(4..6) }
    let!(:other_product_count) { rand(2..3) }
    let!(:generic_products) do
      create_list(:generic_product, match_product_count) do |generic_product|
        generic_product.update(code: "AXIQND-#{rand(1..99_999)}")
        create(:cenabast_product, vendor: create(:vendor), generic_product:)
      end
    end
    let!(:other_generic_products) do
      create_list(:generic_product, other_product_count) do |generic_product|
        generic_product.update(code: "XAIPPP-#{rand(1..99_999)}")
        create(:cenabast_product, vendor: create(:vendor), generic_product:)
      end
    end
    let!(:product) { generic_products.first.products.first }

    include_examples 'has product search information'
  end

  context 'ignoring other products, matching those that only have the ZCEN code root' do
    let!(:keywords) { 'QODLSICN' }
    let!(:match_product_count) { rand(4..6) }
    let!(:other_product_count) { rand(2..3) }
    let!(:contracts) do
      create_list(:contract, match_product_count) do |contract|
        contract.update(code: "QODLSICN-#{rand(1..99_999)}")
        create(:cenabast_product, vendor: create(:vendor), contract:)
      end
    end
    let!(:other_contracts) do
      create_list(:contract, other_product_count) do |contract|
        contract.update(code: "AXIQND-#{rand(1..99_999)}")
        create(:cenabast_product, vendor: create(:vendor), contract:)
      end
    end
    let!(:product) { contracts.first.product }

    include_examples 'has product search information'
  end
end
