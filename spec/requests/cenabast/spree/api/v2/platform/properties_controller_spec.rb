require 'rails_helper'

RSpec.describe Spree::Api::V2::Platform::PropertiesController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get api_v2_platform_properties_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about properties' do
      property = create(:property)

      get api_v2_platform_properties_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(property.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['name']).to eq(property.name)
      expect(attributes['presentation']).to eq(property.presentation)
      expect(attributes['filterable']).to eq(property.filterable)
      expect(attributes['filter_param']).to eq(property.filter_param)

      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one property' do
      properties = Array.new(rand(2..4)).map { |_| create(:property, name: Faker::Lorem.word) }

      get api_v2_platform_properties_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(properties.count)
    end

    it 'can filter using ransack to only show one property in particular' do
      properties = Array.new(rand(2..4)).map { |_| create(:property, name: Faker::Lorem.word) }
      property = properties.sample
      get api_v2_platform_properties_path('filter[name_eq]': property.name), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)

      attributes = response.parsed_body['data'][0]['attributes']
      expect(attributes['name']).to eq(property.name)
    end
  end

  describe 'POST #create' do
    let(:property_payload) do
      {
        property: {
          name: 'unit-venta-test',
          presentation: 'Unidad de venta',
          filterable: true,
          filter_param: 'unit-venta'
        }
      }
    end

    it 'creates a new property from payload' do
      expect do
        post api_v2_platform_properties_path, params: property_payload, headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Spree::Property, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(Spree::Property.last).not_to be_nil
      expect(Spree::Property.last.name).to eq(property_payload[:property][:name])
    end
  end

  describe 'PUT #update' do
    let!(:property) { create(:property) }
    let(:property_payload) do
      {
        property: {
          name: 'updated-property-name'
        }
      }
    end

    it 'updates a property from payload' do
      put spree.api_v2_platform_property_path(id: property.id),
          params: property_payload.to_json,
          headers: {
            Authorization: "Bearer #{token.token}",
            'Content-Type': 'application/json'
          }

      expect(response).to have_http_status(:success)
      expect(property.reload.name).to eq(property_payload[:property][:name])
    end
  end
end
