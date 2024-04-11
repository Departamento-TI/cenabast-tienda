require 'rails_helper'

RSpec.describe Cenabast::Spree::Api::V2::Storefront::CountiesController, type: :request do
  describe 'GET #index' do
    before(:each) do
      create_list(:county, rand(7..9))
    end

    it 'returns a successful response' do
      get api_v2_storefront_counties_path
      expect(response).to have_http_status(:success)
    end

    it 'returns stores information' do
      get api_v2_storefront_counties_path

      expect(response.parsed_body['data'].count).to eq(Spree::County.count)

      attributes = response.parsed_body['data'][0]['attributes']
      expect(attributes['name']).not_to be_nil
      expect(attributes['code']).not_to be_nil
    end
  end
end
