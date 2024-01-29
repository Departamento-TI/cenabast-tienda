require 'rails_helper'

RSpec.describe Spree::Variant, type: :model, search: true do
  let!(:store) { create(:store) }
  let!(:product) { create(:product, stores: [store]) }

  it 'searches' do
    create(:variant, sku: 'Testing', product:)
    described_class.search_index.refresh
    assert_equal ['Testing'], described_class.search('testing').map(&:sku)
  end
end