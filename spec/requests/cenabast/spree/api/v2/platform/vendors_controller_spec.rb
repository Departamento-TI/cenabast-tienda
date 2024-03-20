require 'rails_helper'

RSpec.describe Cenabast::Spree::Api::V2::Platform::VendorsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get api_v2_platform_vendors_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about vendors' do
      vendor = create(:vendor)

      get api_v2_platform_vendors_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(vendor.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['name']).to eq(vendor.name)
      expect(attributes['state']).to eq(vendor.state)
      expect(attributes['run']).to eq(vendor.run)
      expect(attributes['email']).to eq(vendor.email)

      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one vendor' do
      vendors = create_list(:vendor, rand(2..4))

      get api_v2_platform_vendors_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(vendors.count)
    end

    it 'can filter using ransack to only show one vendor in particular' do
      vendors = create_list(:vendor, rand(2..4))
      vendor = vendors.sample
      get api_v2_platform_vendors_path('filter[run_eq]': vendor.run), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)

      attributes = response.parsed_body['data'][0]['attributes']
      expect(attributes['run']).to eq(vendor.run)
    end
  end

  describe 'POST #create' do
    let(:vendor_payload) do
      {
        vendor: {
          name: 'Schneider-Ruecker 2',
          state: 'active',
          run: '186059565',
          first_name: 'Leonardo',
          last_name: 'Test',
          email: 'leo.test@lehner.example',
          land_phone: '(823) 909-8064',
          mobile_phone: '179-657-2761'
        }
      }
    end

    it 'creates a new vendor from payload' do
      expect do
        post api_v2_platform_vendors_path, params: vendor_payload, headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Spree::Vendor, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(Spree::Vendor.last).not_to be_nil
      expect(Spree::Vendor.last.run).to eq(vendor_payload[:vendor][:run])
    end
  end

  describe 'PUT #update' do
    let!(:vendor) { create(:vendor) }
    let(:vendor_payload) do
      {
        vendor: {
          name: 'Updated Vendor Name'
        }
      }
    end

    it 'updates a vendor from payload' do
      put api_v2_platform_vendor_path(id: vendor.id),
          params: vendor_payload.to_json,
          headers: {
            Authorization: "Bearer #{token.token}",
            'Content-Type': 'application/json'
          }

      expect(response).to have_http_status(:success)
      expect(vendor.reload.name).to eq(vendor_payload[:vendor][:name])
    end
  end
end
