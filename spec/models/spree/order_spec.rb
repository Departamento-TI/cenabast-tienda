require 'rails_helper'

RSpec.describe Spree::Order, type: :model do
  describe 'associations' do
    it { should belong_to(:receiver).class_name('Cenabast::Spree::Receiver') }
  end

  describe '#inject_to_erp!' do
    let(:order) { create(:order) }

    it 'calls send_order on the appropriate injector' do
      expect(Cenabast::Spree::Erp::InjectorFactory).to receive(:create_injector).and_return(double(send_order: true))
      order.inject_to_erp!
    end
  end

  describe 'callback: after_transition to: :complete' do
    let(:order) { create(:order, state: 'payment') }

    it 'triggers inject_to_erp! after transitioning to :complete' do
      expect(order).to receive(:inject_to_erp!)
      order.next
    end
  end
end
