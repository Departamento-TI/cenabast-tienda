require 'rails_helper'

module Cenabast
  module Spree
    module Order
      RSpec.describe StockValidator do
        describe '#can_supply?' do
          before(:each) do
            VCR.insert_cassette 'cenabast/api/stock_validator_valid', erb: true
          end

          after(:each) do
            VCR.eject_cassette
          end

          context 'when line item has enough stock' do
            let(:line_item) do
              create(:line_item, quantity: 4) do |line_item|
                create(:contract, product: line_item.product, sale_order: 'At')
              end
            end

            subject { described_class.new(line_item) }

            let!(:result) { subject.can_supply? }

            it 'returns true' do
              expect(result).to be_truthy
            end

            it 'does not have error messages' do
              expect(subject.error_messages).to be_empty
            end
          end

          context 'when line item surpass available quantity' do
            let(:line_item) do
              create(:line_item, quantity: 14) do |line_item|
                create(:contract, product: line_item.product, sale_order: 'At')
              end
            end

            subject { described_class.new(line_item) }

            let!(:result) { subject.can_supply? }

            it 'returns false' do
              expect(result).to be_falsey
            end

            it 'returns an error' do
              expect(subject.error_messages.count).to eq 1
            end
          end

          context 'when line item contains invalid sale_order' do
            let(:line_item) do
              create(:line_item, quantity: 4) do |line_item|
                create(:contract, product: line_item.product, sale_order: 'InvalidSaleOrder')
              end
            end

            subject { described_class.new(line_item) }
            let!(:result) { subject.can_supply? }

            it 'returns false' do
              expect(result).to be_falsey
            end

            it 'returns an error' do
              expect(subject.error_messages.count).to eq 1
            end
          end
        end
      end
    end
  end
end
