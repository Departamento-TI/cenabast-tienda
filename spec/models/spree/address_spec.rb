require 'rails_helper'

RSpec.describe Spree::Address, type: :model do
  describe 'Has Run concern' do
    describe 'Validations' do
      it { should validate_presence_of :run }
      it { should validate_with Cenabast::Spree::HasRun::CenabastRunValidator }
    end
  end

  describe 'Has County concern' do
    describe 'Associations' do
      it { should belong_to(:county).class_name('Spree::County').required }
    end

    it 'validates state belongs to country' do
      country = create(:country)
      state = create(:state, country:)
      address = build(:address, state:, country:)
      expect(address).to be_valid

      address.state = create(:state, country: create(:country))
      expect(address).to_not be_valid
    end

    it 'validates county belongs to state' do
      state = create(:state)
      county = create(:county, state:)
      address = build(:address, county:, state:)
      expect(address).to be_valid

      address.county = create(:county, state: create(:state))
      expect(address).to_not be_valid
    end
  end

  describe 'callbacks' do
    describe '#adjust_missing_fields' do
      it 'fills in missing lastname with "--"' do
        address = build(:address, lastname: nil)
        address.valid?
        expect(address.lastname).to eq('--')
      end

      it 'fills in missing city with county name' do
        county = create(:county, name: 'Test County')
        address = build(:address, city: nil, county:)
        address.valid?
        expect(address.city).to eq('Test County')
      end
    end
  end
end
