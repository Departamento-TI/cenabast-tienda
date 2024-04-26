require 'rails_helper'

RSpec.describe Cenabast::Spree::UserPreferencesController, type: :request do
  describe '#toggle_store' do
    context 'as non admin user' do
      let(:user) { create(:user) }
      let(:stores) { create_list(:store, 3) }
      let(:run) { '111111111' }

      before do
        act_as_logged_in(user)
        @receivers = stores.map do |store|
          create(:receiver, run:, store:)
        end
      end

      it 'can toggle the store to an another allowed one' do
        user.receivers << @receivers
        user.current_receiver = user.receivers.sample
        user.save

        other_receiver = (@receivers - [user.current_receiver]).sample
        store = other_receiver.store

        post toggle_store_path(option_id: store.id)

        expect(response).to redirect_to(spree.root_path)
        expect(user.reload.current_store).to eq(store)
      end

      it 'cant toggle the store to an not allowed one' do
        user.receivers << @receivers.sample(2)
        user.current_receiver = user.receivers.sample
        user.save

        other_receiver = (@receivers - user.receivers).sample
        store = other_receiver.store

        post toggle_store_path(option_id: store.id)

        expect(response).to redirect_to(spree.root_path)
        expect(user.reload.current_store).not_to eq(store)
      end

      it 'redirects back to the spree root path even if location if provided' do
        post toggle_store_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to(spree.root_path)
      end
    end

    context 'as admin user' do
      let(:user) { create(:admin_user) }
      let(:stores) { create_list(:store, 3) }
      let(:run) { '111111111' }

      before do
        act_as_logged_in(user)
        @receivers = stores.map do |store|
          create(:receiver, run:, store:)
        end
      end

      it 'can toggle the store to an another allowed one' do
        user.receivers << @receivers
        user.current_receiver = user.receivers.sample
        user.save

        other_receiver = (@receivers - [user.current_receiver]).sample
        store = other_receiver.store

        post toggle_store_path(option_id: store.id)

        expect(response).to redirect_to(spree.root_path)
        expect(user.reload.current_store).to eq(store)
      end

      it 'can toggle the store to an not explicitly allowed one' do
        user.receivers << @receivers.sample(2)
        user.current_receiver = user.receivers.sample
        user.save

        other_receiver = (@receivers - user.receivers).sample
        store = other_receiver.store

        post toggle_store_path(option_id: store.id)

        expect(response).to redirect_to(spree.root_path)
        expect(user.reload.current_store).to eq(store)
      end

      it 'redirects back to the spree root path even if location if provided' do
        post toggle_store_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to(spree.root_path)
      end
    end
  end

  describe 'POST #toggle_receiver' do
    context 'as non admin user' do
      let(:user) { create(:user) }
      let(:receivers) { create_list(:receiver, 3) }

      before do
        act_as_logged_in(user)
        allow(controller).to receive(:spree_current_user).and_return(user)
        allow(controller).to receive(:current_order).with(create_order_if_necessary: true).
          and_return(double('Order'))
      end

      it 'toggles the receiver for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = (receivers - [user.current_receiver]).sample

        post toggle_receiver_path(option_id: other_receiver.id)

        expect(user.reload.current_receiver).to eq(other_receiver)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'doesnt allow to toggle to a non explicitly given receiver for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = create_list(:receiver, 3).sample

        post toggle_receiver_path(option_id: other_receiver.id)

        expect(user.reload.current_receiver).not_to eq(other_receiver)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'redirects back to fallback location if provided' do
        post toggle_receiver_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to('/fallback_location')
      end
    end

    context 'as admin user' do
      let(:user) { create(:admin_user) }
      let(:receivers) { create_list(:receiver, 3) }

      before do
        act_as_logged_in(user)
        allow(controller).to receive(:spree_current_user).and_return(user)
        allow(controller).to receive(:current_order).with(create_order_if_necessary: true).
          and_return(double('Order'))
      end

      it 'toggles the receiver for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = (receivers - [user.current_receiver]).sample

        post toggle_receiver_path(option_id: other_receiver.id)

        expect(user.reload.current_receiver).to eq(other_receiver)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'allows even toggling to a non explicitly given receiver for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = create_list(:receiver, 3).sample

        post toggle_receiver_path(option_id: other_receiver.id)

        expect(user.reload.current_receiver).to eq(other_receiver)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'redirects back to fallback location if provided' do
        post toggle_receiver_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to('/fallback_location')
      end
    end
  end

  describe 'POST #toggle_requester' do
    context 'as non admin user' do
      let(:user) { create(:user) }
      let(:receivers) { create_list(:receiver, 3) }
      let(:requesters) do
        create_list(:requester, 3) do |requester, i|
          requester.receiver = receivers[i]
        end
      end

      before do
        act_as_logged_in(user)
        allow(controller).to receive(:spree_current_user).and_return(user)
        allow(controller).to receive(:current_order).with(create_order_if_necessary: true).
          and_return(double('Order'))
      end

      it 'toggles the requester for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = (receivers - [user.current_receiver]).sample

        post toggle_requester_path(option_id: other_receiver.requester.id)

        expect(user.reload.current_requester).to eq(other_receiver.requester)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'doesnt allow to toggle to a non explicitly given requester for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = create(:receiver, requester: create(:requester))

        post toggle_requester_path(option_id: other_receiver.requester.id)

        expect(user.reload.current_requester).not_to eq(other_receiver.requester)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'redirects back to fallback location if provided' do
        post toggle_requester_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to('/fallback_location')
      end
    end

    context 'as admin user' do
      let(:user) { create(:admin_user) }
      let(:receivers) { create_list(:receiver, 3) }
      let(:requesters) do
        create_list(:requester, 3) do |requester, i|
          requester.receiver = receivers[i]
        end
      end

      before do
        act_as_logged_in(user)
        allow(controller).to receive(:spree_current_user).and_return(user)
        allow(controller).to receive(:current_order).with(create_order_if_necessary: true).
          and_return(double('Order'))
      end

      it 'toggles the requester for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = (receivers - [user.current_receiver]).sample

        post toggle_requester_path(option_id: other_receiver.requester.id)

        expect(user.reload.current_requester).to eq(other_receiver.requester)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'does not change the requester if an invalid option is given as a parameter' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        current_requester = user.current_requester

        post toggle_requester_path(option_id: 9999)

        expect(user.reload.current_requester).to eq(current_requester)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'does allow to toggle to a non explicitly given requester for the current user' do
        user.receivers << receivers
        user.current_receiver = user.receivers.sample
        user.save
        other_receiver = create(:receiver, requester: create(:requester))

        post toggle_requester_path(option_id: other_receiver.requester.id)

        expect(user.reload.current_requester).to eq(other_receiver.requester)
        expect(response).to redirect_to(spree.root_path)
      end

      it 'redirects back to fallback location if provided' do
        post toggle_requester_path(option_id: 5), headers: { HTTP_REFERER: '/fallback_location' }

        expect(response).to redirect_to('/fallback_location')
      end
    end
  end
end
