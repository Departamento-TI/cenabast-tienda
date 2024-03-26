require 'rails_helper'

module Cenabast
  module Spree
    module Order
      RSpec.describe StockValidator do
        describe '#call' do
          before(:each) do
            VCR.insert_cassette 'cenabast/api/stock_validator_valid', erb: true
          end

          after(:each) do
            VCR.eject_cassette
          end

          let(:order) { create(:order) }
          subject { described_class.new(order) }

          context 'when order has enough stock for each item' do
            before do
              create(:line_item, order:, variant: create(:variant, sku: 'At'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Bt'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Ct'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Dt'), quantity: 4)
            end

            let!(:result) { subject.call }

            it 'returns the order' do
              expect(result).to be_instance_of(::Spree::Order)
            end

            it 'does not have error messages' do
              expect(subject.error_messages).to be_empty
            end
          end

          context 'when order surpass available quantity for one item' do
            before do
              create(:line_item, order:, variant: create(:variant, sku: 'At'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Bt'), quantity: 14)
            end

            let!(:result) { subject.call }

            it 'returns nil result' do
              expect(result).to be_nil
            end

            it 'returns an error' do
              expect(subject.error_messages.count).to eq 1
            end
          end

          context 'when order contains invalid item' do
            before do
              create(:line_item, order:, variant: create(:variant, sku: 'At'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Bt'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Ct'), quantity: 4)
              create(:line_item, order:, variant: create(:variant, sku: 'Invalidsku'), quantity: 4)
            end

            let!(:result) { subject.call }

            it 'returns nil result' do
              expect(result).to be_nil
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
