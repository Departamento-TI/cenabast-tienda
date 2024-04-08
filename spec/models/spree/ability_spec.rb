require 'spec_helper'
require 'cancan/matchers'
require 'spree/testing_support/ability_helpers'
require 'spree/testing_support/bar_ability'

describe Spree::Ability, type: :model do
  let(:store) { create(:store) }
  let(:user) { build(:user, run: Spree::User.raw_run_to_formatted(Faker::ChileRut.rut.to_s)) }
  let(:ability) { Spree::Ability.new(user) }
  let(:token) { nil }

  after do
    Spree::Ability.abilities = Set.new
  end

  context 'as non-admin/guest User' do
    context 'for County' do
      let(:resource) { Spree::County.new }

      context 'requested by any user' do
        it_behaves_like 'read only'
      end
    end

    context 'for Order' do
      let(:resource) { Spree::Order.new }

      context 'requested by user with same receiver' do
        before do
          allow(resource).to receive_messages(completed?: false)
          receiver = create(:receiver)
          user.receivers = [receiver]
          user.save
          user.toggle_receiver(receiver)
          resource.update(receiver:)
        end

        it_behaves_like 'access granted'
        it_behaves_like 'no index allowed'
      end

      context 'requested by user with different receiver' do
        before do
          allow(resource).to receive_messages(completed?: false)
          receiver = create(:receiver)
          other_receiver = create(:receiver)
          user.receivers = [other_receiver]
          user.save
          user.toggle_receiver(other_receiver)
          resource.update(receiver:)
        end

        it_behaves_like 'create only'
      end

      context 'requested with proper token' do
        let(:token) { 'TOKEN123' }

        before { allow(resource).to receive_messages(token:) }

        it_behaves_like 'access granted'
        it_behaves_like 'no index allowed'
      end

      context 'requested with improper token' do
        let(:token) { 'TOKEN123' }

        before do
          allow(resource).to receive_messages(completed?: false)
          allow(resource).to receive_messages(token: 'FAIL')
          receiver = create(:receiver)
          resource.update(receiver:)
        end

        it_behaves_like 'create only'
      end
    end
  end
end
