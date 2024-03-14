require 'rails_helper'

RSpec.describe Cenabast::Spree::Api::V2::Platform::GenericProductsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get api_v2_platform_generic_products_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about generic products' do
      generic_product = create(:generic_product)

      get api_v2_platform_generic_products_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(generic_product.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['code']).to eq(generic_product.code)
      expect(attributes['code_atc']).to eq(generic_product.code_atc)
      expect(attributes['code_onu']).to eq(generic_product.code_onu)
      expect(attributes['code_ean']).to eq(generic_product.code_ean)
      expect(attributes['denomination']).to eq(generic_product.denomination)
      expect(attributes['standard_denomination']).to eq(generic_product.standard_denomination)
      expect(attributes['product_type']).to eq(generic_product.product_type)
      expect(attributes['hierarchy']).to eq(generic_product.hierarchy)
      expect(attributes['ump']).to eq(generic_product.ump)
      expect(attributes['manufacturer']).to eq(generic_product.manufacturer)
      expect(attributes['base_table']).to eq(generic_product.base_table)

      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one generic product' do
      generic_products = create_list(:generic_product, rand(2..4))

      get api_v2_platform_generic_products_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(generic_products.count)
    end

    it 'can filter using ransack to only show one generic product in particular' do
      generic_products = create_list(:generic_product, rand(2..4))
      generic_product = generic_products.sample
      get api_v2_platform_generic_products_path('filter[code_eq]': generic_product.code), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
    end
  end

  describe 'POST #create' do
    let(:generic_product_payload) do
      {
        generic_product: {
          code: 'NewCode1asdasd2342',
          code_atc: 'ewcwiy',
          code_onu: 'jxabos',
          code_ean: '29551453',
          denomination: 'ut',
          standard_denomination: 'voluptatem',
          product_type: 'generic',
          hierarchy: 'qui',
          ump: 'dolor',
          manufacturer: 'dolorum',
          base_table: 'fuga'
        }
      }
    end

    it 'creates a new generic product from payload' do
      expect do
        post api_v2_platform_generic_products_path,
             params: generic_product_payload,
             headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Cenabast::Spree::GenericProduct, :count).by(1)

      expect(response).to have_http_status(:created)

      generic_product = Cenabast::Spree::GenericProduct.last
      expect(generic_product).not_to be_nil
      expect(generic_product.code).to eq(generic_product_payload[:generic_product][:code])
    end
  end

  describe 'PUT #update' do
    let!(:generic_product) { create(:generic_product) }
    let(:generic_product_payload) do
      {
        generic_product: {
          code: 'NewEditedCode123'
        }
      }
    end

    it 'edits a generic product from payload' do
      expect do
        put api_v2_platform_generic_product_path(generic_product),
            params: generic_product_payload,
            headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Cenabast::Spree::Contract, :count).by(0)

      expect(response).to have_http_status(:success)

      generic_product = Cenabast::Spree::GenericProduct.last
      expect(generic_product.code).to eq(generic_product_payload[:generic_product][:code])
    end
  end
end
