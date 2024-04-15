require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::SaleOrder, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:detail_lines).class_name('Cenabast::Spree::Erp::DetailLine').dependent(:destroy) }
    it { is_expected.to have_many(:line_items).through(:detail_lines).class_name('Spree::LineItem') }
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:status).with_values(initial: 0, sent: 1, failed: 2, nullified: 3, cancellation_pending: 4) }
  end

  describe '.create_with_line_items!' do
    let(:order) { create(:order) }
    let(:line_items) { create_list(:line_item, rand(3..5), order:) }

    it 'can create with a list_of_line_items' do
      expect do
        subject.class.create_with_line_items!(line_items)
      end.to change(Cenabast::Spree::Erp::SaleOrder, :count).by(1)

      sale_order = Cenabast::Spree::Erp::SaleOrder.last
      expect(sale_order.line_items.count).to eq(line_items.count)
      expect(sale_order.order).to eq(order)
    end
  end

  describe '#send_to_erp!' do
    before do
      allow(Cenabast::Spree::Erp::SendSaleOrderToErp).to receive(:perform_later).and_return(
        double(true)
      )
    end

    it 'calls SendSaleOrderToErp perform_later' do
      subject.send_to_erp!
      expect(Cenabast::Spree::Erp::SendSaleOrderToErp).to have_received(:perform_later).with(subject)
    end
  end

  describe '#cancel_in_erp!' do
    subject { create(:erp_sale_order, order: create(:order)) }

    before do
      allow(Cenabast::Spree::Erp::CancelSaleOrderInErp).to receive(:perform_later).and_return(
        double(true)
      )
    end

    it 'calls CancelSaleOrderInErp perform_later' do
      subject.cancel_in_erp!
      expect(Cenabast::Spree::Erp::CancelSaleOrderInErp).to have_received(:perform_later).with(subject)
    end

    it 'sets state as cancellation_pending' do
      subject.cancel_in_erp!
      expect(subject.reload.status).to eq('cancellation_pending')
    end
  end
end
