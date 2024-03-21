require 'rails_helper'

RSpec.describe Spree::Store, type: :model do
  describe 'ClassMethods' do
    describe '.intermediacion' do
      it 'finds the store with code spree-intermediation' do
        intermediacion_store = create(:store, code: 'spree-intermediation')

        expect(described_class.intermediacion).to eq(intermediacion_store)
      end
    end

    describe '.ecommerce' do
      it 'finds the store with code spree-ecommerce' do
        ecommerce_store = create(:store, code: 'spree-ecommerce')

        expect(described_class.ecommerce).to eq(ecommerce_store)
      end
    end
  end

  describe '#settings' do
    it 'has default settings values' do
      store = create(:store)

      expect(store.limit_cart_amount_utm).to eq(4)
      expect(store.current_utm_value).to eq(64_793)
    end

    it 'can update settings values' do
      store = create(:store)

      store.update(limit_cart_amount_utm: 5, current_utm_value: 70_000)

      expect(store.reload.limit_cart_amount_utm).to eq(5)
      expect(store.reload.current_utm_value).to eq(70_000)
    end
  end
end
