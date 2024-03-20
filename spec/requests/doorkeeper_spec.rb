require 'rails_helper'

RSpec.describe 'Doorkeeper routes', type: :request do
  describe 'POST /spree_oauth/token' do
    before(:each) do
      Spree::OauthApplication.find_or_create_by(
        name: 'test',
        uid: 'client_test',
        secret: 'client_test_password',
        scopes: 'admin'
      )
    end

    it 'should return a valid token with client_credentials grant type' do
      post '/spree_oauth/token', params: {
        grant_type: 'client_credentials',
        client_id: 'client_test',
        client_secret: 'client_test_password',
        scope: 'admin'
      }

      expect(response).to have_http_status(:success)
      expect(response.parsed_body).to have_key('access_token')
    end

    it 'should return a invalid token if credentials are not valid' do
      post '/spree_oauth/token', params: {
        grant_type: 'client_credentials',
        client_id: 'client_test-bad',
        client_secret: 'client_test_password-bad',
        scope: 'admin'
      }

      expect(response).not_to have_http_status(:success)
      expect(response.parsed_body).not_to have_key('access_token')
    end
  end
end
