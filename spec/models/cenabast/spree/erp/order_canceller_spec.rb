require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::OrderCanceller, type: :model do
  describe '#call' do
    let(:order) { create(:order, erp_order_ids: [1, 2, 3]) }

    it 'cancels each ERP order associated with the order' do
      expect(Cenabast::Api::Erp::CancelOrder).to receive(:new).with(1).and_call_original
      expect(Cenabast::Api::Erp::CancelOrder).to receive(:new).with(2).and_call_original
      expect(Cenabast::Api::Erp::CancelOrder).to receive(:new).with(3).and_call_original

      canceller = described_class.new(order)
      canceller.call
    end
  end
end
