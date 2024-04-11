require 'rails_helper'

RSpec.describe Cenabast::Spree::Requester, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:receivers).class_name('Cenabast::Spree::Receiver').dependent(:destroy) }
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
