require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::ByVendorInjector do
  describe '#send_order' do
    let(:order) { create(:order_with_line_items, line_items_count: 2) }
    let(:vendor1) { create(:vendor) }
    let(:vendor2) { create(:vendor) }

    context 'when sending the order to ERP via send_to_erp! method' do
      before do
        order.line_items.first.variant.vendor = vendor1
        order.line_items.second.variant.vendor = vendor2
        @receive_count = 0

        allow_any_instance_of(Cenabast::Spree::Erp::SaleOrder).to receive(:send_to_erp!) do
          @receive_count += 1
        end
      end

      it 'sends the order to ERP for each vendor' do
        injector = described_class.new

        expect do
          injector.send_order(order)
        end.to change(Cenabast::Spree::Erp::SaleOrder, :count).by(2)

        expect(@receive_count).to eq(2)
      end
    end
  end
end
