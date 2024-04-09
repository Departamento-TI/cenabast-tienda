require 'rails_helper'

RSpec.describe Cenabast::Api::Erp::CreateOrder do
  let(:order) { create(:order) }
  let(:line_items) { create_list(:line_item, 2, order:) }

  describe '#call' do
    context 'when the API call is successful' do
      it 'creates the order successfully', vcr: { cassette_name: 'cenabast/api/erp/create_order_success' } do
        service = described_class.new(order:, line_items:)

        expect(service.call[:success]).to be true
      end
    end

    context 'when the API call fails' do
      it 'returns a failed response', vcr: { cassette_name: 'cenabast/api/erp/create_order_failure' } do
        order.receiver.requester.run = nil
        service = described_class.new(order:, line_items: nil)

        expect(service.call[:success]).to be false
      end
    end
  end
end
