require 'rails_helper'

RSpec.describe Spree::User, type: :model, search: true do
  describe 'Enums' do
    it { is_expected.to define_enum_for(:user_type).with_values(buyer: 0, provider: 1) }
  end

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
      it { should belong_to(:current_store).optional }
      it { should have_many(:stores).through(:store_users) }
      it { should have_many(:store_users) }
      it { should have_many(:receiver_users) }
      it { should have_many(:receivers).through(:receiver_users) }
      it { should have_many(:requesters).through(:receivers) }
      it { should have_many(:company_users) }
      it { should have_many(:companies).through(:company_users) }
    end

    describe 'Callbacks' do
      describe '#set_current_store' do
        it 'Sets current store after creation for user as the first allowed store (id order)' do
          user = create(:user, stores: create_list(:store, 4), current_store: nil)

          expect(user.current_store).to eq user.stores.order(id: :asc).first
        end
      end
    end

    describe '#availiable_stores' do
      it 'gives every store in system if user is admin' do
        create_list(:store, 10)
        user = create(:admin_user)

        expect(user.availiable_stores).to match_array Spree::Store.all
      end

      it 'gives only stores assigned to him if not admin' do
        create_list(:store, rand(5..10))
        stores = create_list(:store, 4)
        user = create(:user, stores:)

        expect(user.availiable_stores).to match_array stores
      end
    end

    describe '#toggle_store' do
      it 'changes store only if store its under its allowed stores' do
        create_list(:store, 4)
        stores = create_list(:store, 4)
        user = create(:user, stores:)
        store = stores.sample
        user.toggle_store(store)

        expect(user.current_store).to eq store
      end

      it 'doesnt changes store only if store its under its allowed stores' do
        not_allowed_stores = create_list(:store, 4)
        stores = create_list(:store, 4)
        user = create(:user, stores:)
        last_current_store = user.current_store

        store = not_allowed_stores.sample
        user.toggle_store(store)

        expect(user.current_store).to eq last_current_store
      end

      it 'allows admins to pick every store, even if not assigned directly' do
        stores = create_list(:store, 4)
        user = create(:admin_user)
        store = stores.sample
        user.toggle_store(store)

        expect(user.current_store).to eq store
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
