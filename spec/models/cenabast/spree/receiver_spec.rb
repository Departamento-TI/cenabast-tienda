require 'rails_helper'

RSpec.describe Cenabast::Spree::Receiver, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:store).class_name('::Spree::Store') }
    it { is_expected.to belong_to(:requester).class_name('Cenabast::Spree::Requester') }
    it { is_expected.to have_many(:receiver_users).class_name('Cenabast::Spree::ReceiverUser').dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:receiver_users).class_name(Spree.user_class.to_s) }
    it { is_expected.to have_many(:orders).class_name('::Spree::Order').dependent(:nullify) }
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:channel_type).with_values(intermediacion: 0, ecommerce: 1) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Has Run concern' do
    describe 'Validations' do
      it { should validate_presence_of :run }
      it { should validate_with Cenabast::Spree::HasRun::CenabastRunValidator }
    end
  end

  describe '#last_incomplete_spree_order' do
    let(:receiver) { create(:receiver) }
    let(:store) { create(:store) }

    it 'returns the last incomplete order' do
      incomplete_order = create(:order, store:, receiver:)

      expect(receiver.last_incomplete_spree_order(store)).to eq(incomplete_order)
    end

    it 'returns nil if there are no incomplete orders' do
      create(:order, store:, receiver:, completed_at: Time.zone.now)

      expect(receiver.last_incomplete_spree_order(store)).to be_nil
    end
  end
end
