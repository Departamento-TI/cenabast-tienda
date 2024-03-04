require 'rails_helper'

RSpec.describe Cenabast::Spree::User::BuyerUserInformationProcesser, type: :model do
  before(:each) do
    create_cenabast_stores
  end

  describe '#call - valid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/buyer_information_processer_valid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '16338556' }

    it 'creates a model Spree::User for the given RUN' do
      described_class.new(run).call

      user = Spree::User.last
      expect(user.run).to eq '163385562'
    end

    it 'the created Spree::User is of role buyer' do
      described_class.new(run).call

      user = Spree::User.last
      buyer_role = Spree::Role.find_by!(name: 'buyer')
      expect(user.spree_roles).to include(buyer_role)
    end

    it 'increases the count Spree::User by 1' do
      expect do
        described_class.new(run).call
      end.to change(Spree::User, :count).by(1)
    end

    describe 'User already exists' do
      before(:each) do
        create(:user, run: '163385562')
      end

      it 'mantains the count Spree::User as the same' do
        expect do
          described_class.new(run).call
        end.to change(Spree::User, :count).by(0)
      end
    end
  end

  describe '#call - invalid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/buyer_information_processer_invalid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '18605956' }

    it 'mantains the count Spree::User as the same, no user was created' do
      expect do
        described_class.new(run).call
      end.to change(Spree::User, :count).by(0)
    end
  end
end
