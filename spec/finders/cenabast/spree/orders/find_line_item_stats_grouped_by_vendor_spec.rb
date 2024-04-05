require 'rails_helper'

RSpec.describe Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor do
  let(:order) { create(:order) }
  let(:service) { described_class.new(order) }

  describe '#call' do
    it 'returns line item stats grouped by vendor' do
      vendor1 = create(:vendor, name: Faker::Lorem.word)
      vendor2 = create(:vendor, name: Faker::Lorem.word)

      variant1 = create(:on_demand_master_variant, vendor: vendor1)
      variant2 = create(:on_demand_master_variant, vendor: vendor2)
      variant3 = create(:on_demand_master_variant, vendor: vendor2)

      create(:line_item, order:, variant: variant1, price: 10, quantity: 2)
      create(:line_item, order:, variant: variant2, price: 15, quantity: 3)
      create(:line_item, order:, variant: variant3, price: 10, quantity: 1)

      result = service.call

      expect(result.length).to eq(2)

      expect(result[0][:vendor_id]).to eq(vendor1.id)
      expect(result[0][:vendor_name]).to eq(vendor1.name)
      expect(result[0][:subtotal]).to eq(20)

      expect(result[1][:vendor_id]).to eq(vendor2.id)
      expect(result[1][:vendor_name]).to eq(vendor2.name)
      expect(result[1][:subtotal]).to eq(55)
    end

    describe 'order is nil' do
      let(:order) { nil }

      it 'returns a nil value' do
        expect(result).to be_nil
      end
    end
  end
end
