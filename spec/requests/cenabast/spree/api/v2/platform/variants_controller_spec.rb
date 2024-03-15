require 'rails_helper'

RSpec.describe Spree::Api::V2::Platform::VariantsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  before(:each) do
    @stores = create_cenabast_stores
    admin.toggle_store(@stores.first)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get spree.api_v2_platform_variants_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about variants' do
      variant = create(:product, stores: @stores).master

      get spree.api_v2_platform_variants_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(variant.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['name']).to eq(variant.name)
      expect(attributes['sku']).to eq(variant.sku)
      expect(attributes['total_on_hand']).to eq(variant.total_on_hand)
      expect(attributes['currency']).to eq(variant.currency)
      expect(attributes['cost_currency']).to eq(variant.cost_currency)
      expect(attributes['cost_price']).to eq(variant.cost_price.to_s)
      expect(attributes['price']).to eq(variant.price.to_s)

      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one variant' do
      variants = create_list(:product, rand(2..4), stores: @stores).map(&:master)

      get spree.api_v2_platform_variants_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(variants.count)
    end

    it 'can filter using ransack to only show one variant in particular' do
      variants = create_list(:product, rand(2..4), stores: @stores).map(&:master)
      variant = variants.sample

      params = {
        'filter[product_id_eq]': variant.product_id,
        'filter[is_master_eq]': true
      }
      get spree.api_v2_platform_variants_path(params), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)

      attributes = response.parsed_body['data'][0]['attributes']
      expect(attributes['sku']).to eq(variant.sku)
    end
  end

  describe 'PUT #update' do
    let!(:variant) { create(:product, stores: @stores).master }
    let(:variant_payload) do
      {
        variant: {
          sku: 'zcen-sku-1234',
          currency: 'CLP',
          cost_currency: 'CLP',
          price: 14_000.0,
        }
      }
    end

    it 'updates a variant from payload' do
      put spree.api_v2_platform_variant_path(id: variant.id),
          params: variant_payload.to_json,
          headers: {
            Authorization: "Bearer #{token.token}",
            'Content-Type': 'application/json'
          }

      expect(response).to have_http_status(:success)
      expect(variant.reload.sku).to eq(variant_payload[:variant][:sku])
      expect(variant.reload.currency).to eq(variant_payload[:variant][:currency])
      expect(variant.reload.cost_currency).to eq(variant_payload[:variant][:cost_currency])
      expect(variant.reload.price).to eq(variant_payload[:variant][:price])
    end
  end
end
