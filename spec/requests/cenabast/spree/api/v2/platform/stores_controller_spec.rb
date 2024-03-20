require 'rails_helper'

RSpec.describe Spree::Api::V2::Platform::StoresController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    before(:each) do
      create_cenabast_stores
    end

    it 'returns a successful response' do
      get spree.api_v2_platform_stores_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns stores information' do
      get spree.api_v2_platform_stores_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(Spree::Store.count)

      store = Spree::Store.first
      attributes = response.parsed_body['data'][0]['attributes']
      expect(attributes['name']).to eq(store.name)
      expect(attributes['url']).to eq(store.url)
    end
  end
end
