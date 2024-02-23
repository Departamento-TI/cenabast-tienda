require 'rails_helper'

RSpec.describe Cenabast::Spree::User::ReceiversInformationProcesser, type: :model do
  describe '#call - valid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/receivers_information_processer_valid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '16338556' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'creates a model Spree::Receiver that links to the given user RUN' do
      described_class.new(run).call

      receiver = Cenabast::Spree::Receiver.last
      expect(receiver.users.first.run).to eq formatted_run
    end

    it 'increases the count Spree::Requests for the user by 2' do
      expect do
        described_class.new(run).call
      end.to change(user.reload.receivers, :count).by(2)
    end

    describe 'receivers already exists' do
      before(:each) do
        requester = create(:requester, run: '616076000')
        create(:receiver, run: '2017075', requester:)
        create(:receiver, run: '2019922', requester:)
      end

      it 'mantains the count Spree::Receiver as the same' do
        expect do
          described_class.new(run).call
        end.to change(Cenabast::Spree::Receiver, :count).by(0)
      end

      it 'stills increases the count Cenabast::Spree::ReceiverUser as it wasnt linked' do
        expect do
          described_class.new(run).call
        end.to change(Cenabast::Spree::ReceiverUser, :count).by(2)
      end
    end

    describe 'receiver exists, is not on the response' do
      let!(:receiver) { create(:receiver, run: '631249833') }
      let!(:receiver_user) { create(:receiver_user, receiver:, user:) }

      it 'destroys the Cenabast::Spree::ReceiverUser record as its no longer valid' do
        described_class.new(run).call

        expect(Cenabast::Spree::ReceiverUser.exists?(receiver_user.id)).to eq false
      end

      it 'mantains the Spree::Receiver record' do
        described_class.new(run).call

        expect(Cenabast::Spree::Receiver.exists?(receiver.id)).to eq true
      end
    end
  end

  describe '#call - invalid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/receivers_information_processer_invalid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '18605956' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'mantains the count Cenabast::Spree::Receiver as the same, no receivers were created' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Receiver, :count).by(0)
    end

    it 'mantains the count Cenabast::Spree::ReceiverUser as the same, no receivers-user links were created' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::ReceiverUser, :count).by(0)
    end
  end
end
