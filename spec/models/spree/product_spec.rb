require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  describe 'associations' do
    it { should have_one(:contract).class_name('Cenabast::Spree::Contract').dependent(:destroy) }
    it { should belong_to(:generic_product).class_name('Cenabast::Spree::GenericProduct').optional }
    it { should belong_to(:vendor).class_name('Spree::Vendor').optional }
  end

  describe 'Searchkick', search: true do
    let!(:store) { create(:store) }

    it 'searches' do
      create(:product, sku: 'Testing', product:)
      described_class.search_index.refresh
      assert_equal ['Testing'], described_class.search('testing').map(&:sku)
    end
  end
end
