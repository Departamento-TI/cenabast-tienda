require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::ByVendorInjector do
  describe '#send_order' do
    let(:order) { create(:order_with_line_items, line_items_count: 2) }
    let(:vendor1) { create(:vendor) }
    let(:vendor2) { create(:vendor) }

    before do
      order.line_items.first.variant.vendor = vendor1
      order.line_items.second.variant.vendor = vendor2

      allow(Cenabast::Api::Erp::CreateOrder).to receive(:new).and_return(
        double(call: { success: true })
      )
    end

    context 'when sending the order to ERP' do
      it 'sends the order to ERP for each vendor' do
        injector = described_class.new

        expect(Cenabast::Api::Erp::CreateOrder).to receive(:new).with(order:, line_items: [order.line_items.first]).and_call_original
        expect(Cenabast::Api::Erp::CreateOrder).to receive(:new).with(order:, line_items: [order.line_items.second]).and_call_original

        injector.send_order(order)
      end
    end

    context 'when processing the response' do
      it 'logs the processing of ERP order creation response' do
        expect(Rails.logger).to receive(:info).with(/Processing ERP order creation response/).twice

        injector = described_class.new
        injector.send_order(order)
      end

      it 'calls process_response method for each response' do
        expect_any_instance_of(described_class).to receive(:process_response).twice

        injector = described_class.new
        injector.send_order(order)
      end
    end
  end
end
