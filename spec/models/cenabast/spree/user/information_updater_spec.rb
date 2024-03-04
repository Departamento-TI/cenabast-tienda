require 'rails_helper'

RSpec.describe Cenabast::Spree::User::InformationUpdater, type: :model do
  before(:each) do
    create_cenabast_stores
  end

  describe '#call - valid buyer run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/information_updater_buyer_run_spec', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '16338556' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }

    it 'creates a model Spree::User for the given RUN' do
      described_class.new(run).call

      user = Spree::User.last
      expect(user.run).to eq formatted_run
    end

    it 'returns true' do
      response = described_class.new(run).call
      expect(response).to eq true
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

    it 'creates receivers' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Receiver, :count).by(2)
    end

    it 'creates requester' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Requester, :count).by(1)
    end

    it 'doesnt create companies' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Company, :count).by(0)
    end

    it 'creates receiver user associations' do
      described_class.new(run).call

      user = Spree::User.last
      expect(user.receivers.count).to eq 2
    end
  end

  describe '#call - valid provider run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/information_updater_provider_run_spec', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '55555555' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }

    it 'creates a model Spree::User for the given RUN' do
      described_class.new(run).call

      user = Spree::User.last
      expect(user.run).to eq formatted_run
    end

    it 'returns true' do
      response = described_class.new(run).call
      expect(response).to eq true
    end

    it 'the created Spree::User is of role provider' do
      described_class.new(run).call

      user = Spree::User.last
      provider_role = Spree::Role.find_by!(name: 'provider')
      expect(user.spree_roles).to include(provider_role)
    end

    it 'increases the count Spree::User by 1' do
      expect do
        described_class.new(run).call
      end.to change(Spree::User, :count).by(1)
    end

    it 'creates companies' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Company, :count).by(1)
    end

    it 'creates company user associations' do
      described_class.new(run).call

      user = Spree::User.last
      expect(user.companies.count).to eq 1
    end
  end
end
