require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::SaleOrders::CancelInErp do
  let(:requester) { create(:requester, run: '26.896.041-4') }
  let(:receiver) { create(:receiver, requester:, run: '23.328.386-K') }
  let(:order) { create(:order, receiver:, selected_delivery_port: 'ABC') }
  let(:sale_order) { create(:erp_sale_order, order:, erp_pedido_id: '36') }
  let(:vendors) { create_list(:vendor, 3) }

  before(:each) do
    vendors.each.with_index do |vendor, index|
      contract = create(:contract, sale_order: "111#{index}", mercado_publico_oc: '123')
      product = create(:product_in_stock, contract:, vendor:, sku: "4422#{index}")
      line_item = create(:line_item, order:, product:, quantity: 2)
      create(:erp_detail_line, sale_order:, line_item:)
    end
  end

  describe '#call - valid response' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/erp/sale_orders/cancel_in_erp_valid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    it 'saves status into the sale order' do
      described_class.new(sale_order).call

      expect(sale_order.status).to eq 'nullified'
    end

    it 'saves erp info into the sale order' do
      described_class.new(sale_order).call

      expect(sale_order.nullified_at).not_to be_nil
    end

    context 'calls api service CancelOrder' do
      before(:each) do
        @receive_count = 0

        allow_any_instance_of(Cenabast::Api::Erp::CancelOrder).to receive(:call).and_wrap_original do |original_method, *args, &block|
          @receive_count += 1
          original_method.call(*args, &block)
        end
      end

      it 'calls api service CancelOrder' do
        described_class.new(sale_order).call

        expect(@receive_count).to eq 1
      end

      it 'doesnt call anything if sale order is already nullified' do
        sale_order.nullified!
        described_class.new(sale_order).call

        expect(@receive_count).to eq 0
      end
    end
  end

  describe '#call - invalid server response' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/erp/sale_orders/cancel_in_erp_invalid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    it 'raises an error' do
      expect do
        described_class.new(sale_order).call
      end.to raise_error(StandardError)
    end
  end
end
