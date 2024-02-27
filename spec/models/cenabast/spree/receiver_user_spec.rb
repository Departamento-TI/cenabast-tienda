require 'rails_helper'

RSpec.describe Cenabast::Spree::ReceiverUser, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user).class_name("::#{Spree.user_class}") }
    it { is_expected.to belong_to(:receiver).class_name('Cenabast::Spree::Receiver') }
  end
end
