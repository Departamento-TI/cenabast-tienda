require 'rails_helper'

RSpec.describe Spree::LineItem, type: :model do
  describe '#sufficient_stock?' do
    subject { described_class.new }
    let(:stock_validator) { instance_double(Cenabast::Spree::Order::StockValidator) }

    before do
      allow(Cenabast::Spree::Order::StockValidator).to receive(:new).with(subject).and_return(stock_validator)
    end

    it 'when there is enough stock from Cenabast API' do
      allow(stock_validator).to receive(:can_supply?).and_return(true)

      expect(subject.sufficient_stock?).to be_truthy
    end

    it 'when there is not enough stock from Cenabast API' do
      allow(stock_validator).to receive(:can_supply?).and_return(false)

      expect(subject.sufficient_stock?).to be_falsey
    end
  end
end
