require 'rails_helper'

RSpec.describe Spree::User, type: :model, search: true do
  context '#full_name' do
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
