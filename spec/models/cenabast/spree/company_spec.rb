require 'rails_helper'

RSpec.describe Cenabast::Spree::Company, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:company_users).class_name('Cenabast::Spree::CompanyUser').dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:company_users).class_name(Spree.user_class.to_s) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Has Run concern' do
    describe 'Validations' do
      it { should validate_presence_of :run }
      it { should validate_with Cenabast::Spree::HasRun::CenabastRunValidator }
    end
  end
end
