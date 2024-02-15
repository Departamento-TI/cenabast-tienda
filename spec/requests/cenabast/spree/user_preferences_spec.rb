require 'rails_helper'

RSpec.describe Cenabast::Spree::UserPreferencesController, type: :request do
  describe '#toggle_store' do
    let(:user) { create(:user) }
    let(:stores) { create_list(:store, 3) }

    before do
      allow_any_instance_of(Spree::StoreController).to receive(:spree_user_signed_in?).and_return(true)
      allow_any_instance_of(Spree::StoreController).to receive(:try_spree_current_user).and_return(user)
      allow_any_instance_of(Spree::StoreController).to receive_messages spree_current_user: user
    end

    it 'can toggle the store to an allowed one' do
      user.availiable_stores << stores
      user.save
      store = stores.sample

      post toggle_store_path(option_id: store.id)

      expect(response).to redirect_to(spree.root_path)
      expect(user.reload.current_store).to eq(store)
    end

    it 'cant toggle the store to an not allowed one' do
      user.availiable_stores << stores
      store = create(:store)

      post toggle_store_path(option_id: store.id)

      expect(response).to redirect_to(spree.root_path)
      expect(user.reload.current_store).not_to eq(store)
    end

    it 'redirects back to the fallback location if provided' do
      post toggle_store_path(option_id: stores.sample.id), headers: { HTTP_REFERER: '/fallback_location' }

      expect(response).to redirect_to('/fallback_location')
    end
  end
end
