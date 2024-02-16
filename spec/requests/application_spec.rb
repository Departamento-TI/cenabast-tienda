require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  describe '#any_route' do
    let(:user) { create(:user) }

    it 'redirects to login path if user not logged in' do
      get '/'

      expect(response).to redirect_to spree.new_spree_user_session_path
      expect(response).to have_http_status(:redirect)
    end

    it 'mantains url if user is logged in' do
      act_as_logged_in(user)

      get '/'

      expect(response).not_to have_http_status(:redirect)
    end
  end
end
