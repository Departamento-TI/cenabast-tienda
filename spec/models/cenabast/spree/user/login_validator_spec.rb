require 'rails_helper'

module Cenabast
  module Spree
    module User
      RSpec.describe LoginValidator do
        describe '#call' do
          let(:run) { '11111111' }
          let(:formatted_run) { ::Spree::User.raw_run_to_formatted(run) }

          subject { described_class.new(run) }

          context 'when user meets all conditions' do
            before do
              receivers = create_list(:receiver, 4)
              user = create(:user, run: formatted_run, receivers:)
              role = ::Spree::Role.find_or_create_by!(name: 'buyer')
              ::Spree::RoleUser.find_or_create_by!(role:, user:)
            end

            let!(:result) { subject.call }

            it 'returns the user' do
              expect(result).to be_instance_of(::Spree::User)
            end

            it 'does not have error messages' do
              expect(subject.error_messages).to be_empty
            end
          end

          context 'when user does not exist' do
            let!(:result) { subject.call }

            it 'does not return a user' do
              expect(result).to be_nil
            end

            it 'has an error message' do
              expect(subject.error_messages).to include(::Spree.t(:user_does_not_exist_on_system))
            end
          end

          context 'when user exists, but does not have valid roles' do
            before do
              receivers = create_list(:receiver, 4)
              user = create(:user, run: formatted_run, receivers:)
              role = ::Spree::Role.find_or_create_by!(name: 'provider')
              ::Spree::RoleUser.find_or_create_by!(role:, user:)
            end

            let!(:result) { subject.call }

            it 'does not return a user' do
              expect(result).to be_nil
            end

            it 'has an error message' do
              expect(subject.error_messages).to include(::Spree.t(:user_does_not_has_valid_roles))
            end
          end

          context 'when user is of buyer role, but has not valid receivers to use' do
            before do
              user = create(:user, run: formatted_run, receivers: [])
              role = ::Spree::Role.find_or_create_by!(name: 'provider')
              ::Spree::RoleUser.find_or_create_by!(role:, user:)
            end

            let!(:result) { subject.call }

            it 'does not return a user' do
              expect(result).to be_nil
            end

            it 'has an error message' do
              expect(subject.error_messages).to include(::Spree.t(:buyer_user_not_valid))
            end
          end
        end
      end
    end
  end
end
