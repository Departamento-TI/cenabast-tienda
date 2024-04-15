require 'rails_helper'

RSpec.describe Spree::Order, type: :model do
  describe 'associations' do
    it { should belong_to(:receiver).class_name('Cenabast::Spree::Receiver') }
  end

  describe 'Has Sale Orders concern' do
    describe 'Associations' do
      it { should have_many(:sale_orders).class_name('Cenabast::Spree::Erp::SaleOrder') }
    end

    context '#erp_send_status' do
      let!(:order) { create(:order) }
      let!(:erp_sale_orders) { create_list(:erp_sale_order, 3, order:) }

      it 'returns not_prepared if doesnt has any sale order' do
        order.sale_orders.destroy_all

        expect(order.erp_send_status).to eq(:not_prepared)
      end

      it 'returns pending if some are initial and not failed/nullified' do
        # Only first one is set as sent, others are still initial
        order.sale_orders.first.sent!

        expect(order.erp_send_status).to eq(:pending)
      end

      it 'returns with_errors if some are failed' do
        order.sale_orders.first.failed!

        expect(order.erp_send_status).to eq(:with_errors)
      end

      it 'returns partially_nullified if some are nullified but not all' do
        # Only first one is set as nullified, others are still initial
        order.sale_orders.first.nullified!

        expect(order.erp_send_status).to eq(:partially_nullified)
      end

      it 'returns cancellation_pending if all are cancellation_pending' do
        order.sale_orders.each(&:cancellation_pending!)

        expect(order.erp_send_status).to eq(:cancellation_pending)
      end

      it 'returns sent if all sale_orders are sent' do
        order.sale_orders.each(&:sent!)

        expect(order.erp_send_status).to eq(:sent)
      end

      it 'does not return sent if any of those is not marked as sent' do
        order.sale_orders.each(&:sent!)
        order.sale_orders.first.nullified!

        expect(order.erp_send_status).not_to eq(:sent)
      end
    end
  end

  describe '#payment_required?' do
    it 'does not require payment' do
      expect(subject.payment_required?).to eq(false)
    end
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

  describe '#after_cancel' do
    let(:order) { create(:order, state: 'complete') }

    it 'calls OrderCanceller after canceling the order' do
      canceller_double = instance_double(Cenabast::Spree::Erp::OrderCanceller)
      expect(Cenabast::Spree::Erp::OrderCanceller).to receive(:new).with(order).and_return(canceller_double)
      expect(canceller_double).to receive(:call)

      order.after_cancel
    end
  end
end
