require 'rails_helper'

RSpec.describe Cenabast::Spree::CompanyUser, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user).class_name(Spree.user_class.to_s) }
    it { is_expected.to belong_to(:company).class_name('Cenabast::Spree::Company') }
  end
end
