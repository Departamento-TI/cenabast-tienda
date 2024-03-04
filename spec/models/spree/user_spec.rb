require 'rails_helper'

RSpec.describe Spree::User, type: :model, search: true do
  describe 'Canceled validations' do
    it 'cancels validation for :password' do
      expect(described_class._validators[:password]).to be_empty
    end

    it 'cancels validation for :password_confirmation' do
      expect(described_class._validators[:password_confirmation]).to be_empty
    end
  end

  describe 'Has Run concern' do
    describe 'Validations' do
      it { should validate_presence_of :run }
      it { should validate_with RutValidator }
    end
  end

  describe 'Store Preference concern' do
    describe 'Associations' do
      it { should belong_to(:current_receiver).optional }
      it { should have_many(:receiver_users) }
      it { should have_many(:receivers).through(:receiver_users) }
      it { should have_many(:requesters).through(:receivers) }
      it { should have_many(:company_users) }
      it { should have_many(:companies).through(:company_users) }
    end

    describe 'Callbacks' do
      describe '#set_current_receiver' do
        it 'Sets current receiver after creation for user as the first allowed store (id order)' do
          user = create(:user, receivers: create_list(:receiver, 4), current_receiver: nil)

          expect(user.current_receiver).to eq user.receivers.order(id: :asc).first
        end
      end
    end

    describe '#available_requesters' do
      it 'returns all requesters for admin' do
        create_list(:requester, 10)
        admin = create(:admin_user)
        expect(admin.available_requesters).to eq(Cenabast::Spree::Requester.all)
      end

      it 'returns user requesters for non-admin' do
        create_list(:requester, 10)
        requesters = create_list(:requester, 10)
        receivers = requesters.map do |requester|
          create(:receiver, requester:)
        end
        user = create(:user, receivers:)
        expect(user.available_requesters).to eq(requesters)
      end
    end

    describe '#available_receivers' do
      it 'returns all receivers for current requester for admin' do
        requester = create(:requester)
        receivers = create_list(:receiver, 10, requester:)
        admin = create(:admin_user, current_receiver: receivers.first)

        expect(admin.available_receivers).to eq(receivers)
      end

      it 'returns matching receivers for non-admin' do
        requesters = create_list(:requester, 10)
        receivers = requesters.filter_map do |requester|
          create_list(:receiver, 2, requester:)
        end.flatten.compact.uniq
        current_requester = requesters.sample
        user = create(:user, receivers:, current_receiver: current_requester.receivers.first)

        expect(user.available_receivers).to eq(current_requester.receivers)
      end
    end

    describe '#available_stores' do
      let!(:stores) { create_list(:store, 10) }
      let(:run) { '111111111' }
      let(:user) { create(:user) }

      it 'gives only stores that match the current_store run' do
        selected_stores = stores.sample(4)
        receivers = selected_stores.map do |store|
          create(:receiver, run:, store:)
        end
        extra_store = (stores - selected_stores).sample
        extra_receiver = create(:receiver, run: '186059565', store: extra_store)

        user.receivers = (receivers + [extra_receiver])
        user.current_receiver = receivers.sample
        user.save

        expect(user.available_stores).to eq selected_stores
        expect(user.available_stores).not_to include(extra_store)
      end
    end

    describe '#toggle_receiver' do
      let!(:non_available_receivers) { create_list(:receiver, 4) }
      let!(:available_receivers) { create_list(:receiver, 4) }
      let(:user) { create(:user, receivers: available_receivers) }

      it 'does not toggle receiver if it is not included in receivers' do
        last_current_receiver = user.current_receiver
        user.toggle_receiver(non_available_receivers.sample)

        expect(user.reload.current_receiver).to eq last_current_receiver
      end

      it 'toggles receiver and saves if included in receivers' do
        last_current_receiver = user.current_receiver
        receiver = (available_receivers - [last_current_receiver]).sample
        user.toggle_receiver(receiver)

        expect(user.reload.current_receiver).to eq receiver
        expect(user.reload.current_receiver).not_to eq last_current_receiver
      end
    end

    describe '#toggle_store' do
      let!(:stores) { create_list(:store, 10) }
      let(:run) { '111111111' }
      let(:user) { create(:user) }

      it 'changes store only if store its under its allowed stores for current run of receiver' do
        receivers = stores.sample(4).map do |store|
          create(:receiver, run:, store:)
        end

        user.receivers = receivers
        user.current_receiver = user.receivers.sample
        user.save

        store = (user.available_stores - [user.current_store]).sample
        user.toggle_store(store)

        expect(user.current_store).to eq store
      end

      it 'doesnt changes store only if store its under its allowed stores' do
        not_allowed_stores = create_list(:store, 4)
        receivers = stores.sample(4).map do |store|
          create(:receiver, run:, store:)
        end

        user.receivers = receivers
        user.current_receiver = user.receivers.sample
        user.save

        last_current_store = user.current_store

        store = not_allowed_stores.sample
        user.toggle_store(store)

        expect(user.current_store).to eq last_current_store
      end
    end
  end

  describe '#full_name' do
    it 'returns the concatened result' do
      user = create(:user, first_name: 'Jorge', last_name: 'Perez')

      assert_equal user.full_name, 'Jorge Perez'
    end

    it 'both fields are null returns empty string' do
      user = create(:user, first_name: nil, last_name: nil)

      assert_equal user.full_name, ''
    end
  end
end
