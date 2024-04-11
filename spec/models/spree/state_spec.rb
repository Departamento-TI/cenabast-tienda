require 'rails_helper'

RSpec.describe Spree::State, type: :model do
  describe 'Associations' do
    it 'Has many counties, ordered by name ascending' do
      association = described_class.reflect_on_association(:counties)
      expect(association).to_not be_nil
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
      expect(association.options[:inverse_of]).to eq('state')

      # Test that relationship sorts by name
      state = create(:state)
      counties_number = rand(4..10)
      counties = create_list(:county, counties_number, state:)
      county = counties.last
      county.update(name: 'AAAAA')
      counties.first.update(name: 'ZZZZZ')

      expect(state.reload.counties.first).to eq county
      expect(state.reload.counties.last.name).to eq 'ZZZZZ'
    end
  end
end
