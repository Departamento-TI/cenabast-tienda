require 'rails_helper'

RSpec.describe Spree::County, type: :model do
  describe 'Associations' do
    it { should belong_to(:state).class_name('Spree::State').required }
    it { should have_many(:addresses).dependent(:nullify) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'whitelisted_ransackable_attributes' do
    it 'includes state_id' do
      expect(Spree::County.whitelisted_ransackable_attributes).to include('state_id')
    end
  end

  describe 'json_api_columns' do
    it 'includes state_id' do
      expect(Spree::County.json_api_columns).to include('state_id')
    end
  end
end
