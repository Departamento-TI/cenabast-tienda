require 'rails_helper'

RSpec.describe Cenabast::Spree::UserPreferencesController, type: :request do
  describe '#toggle_store' do
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

  describe 'POST #toggle_receiver' do
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
  end
end
