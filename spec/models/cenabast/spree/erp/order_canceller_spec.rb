require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::OrderCanceller, type: :model do
  describe '#call' do
    let!(:order) { create(:order) }
    let!(:sale_orders) { create_list(:erp_sale_order, rand(1..5), order:) }

    before(:each) do
      @receive_count = 0

      allow_any_instance_of(Cenabast::Spree::Erp::SaleOrder).to receive(:cancel_in_erp!) do
        @receive_count += 1
      end
    end

    it 'cancels each ERP order associated with the order using cancel_in_erp!' do
      canceller = described_class.new(order)
      canceller.call

      expect(@receive_count).to eq(order.sale_orders.count)
    end
  end
end
