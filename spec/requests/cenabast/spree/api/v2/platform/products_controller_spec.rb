require 'rails_helper'

RSpec.describe Spree::Api::V2::Platform::ProductsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get spree.api_v2_platform_products_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about products' do
      product = create(:product)

      get spree.api_v2_platform_products_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(product.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['name']).to eq(product.name)
      expect(attributes['price']).to eq(product.price.to_s)
      expect(attributes['status']).to eq(product.status)
      expect(attributes['available_on']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one product' do
      products = create_list(:product, rand(2..4))

      get spree.api_v2_platform_products_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(products.count)
    end

    it 'can filter using ransack to only show one product in particular' do
      products = create_list(:product, rand(2..4))
      product = products.sample
      get spree.api_v2_platform_products_path('filter[master_sku_eq]': product.master.sku), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
    end
  end

  describe 'POST #create' do
    before(:each) do
      create_cenabast_stores
    end

    let(:shipping_category) { create(:shipping_category) }

    let(:product_payload) do
      {
        product: {
          name: 'Producto de prueba',
          available_on: '2024-02-02T11:35:27.308-03:00',
          discontinue_on: nil,
          price: '14000',
          cost_price: '14000',
          shipping_category_id: shipping_category.id,
          purchasable: true,
          available: true,
          status: 'active',
          store_products_attributes: [
            { store_id: Spree::Store.first.id }
          ]
        }
      }
    end

    it 'creates a new product from payload' do
      post spree.api_v2_platform_products_path, params: product_payload, headers: { Authorization: "Bearer #{token.token}" }

      expect(response).to have_http_status(:created)
      expect(response.parsed_body['data']['attributes']['name']).to eq(product_payload[:product][:name])
      expect(Spree::Product.count).to eq(1)
    end
  end

  describe 'PUT #update' do
    let!(:product) { create(:product) }
    let(:product_payload) do
      {
        product: {
          name: 'Updated Product Name',
          price: 17_000.0
        }
      }
    end

    it 'updates the product attributes' do
      put spree.api_v2_platform_product_path(id: product.id),
          params: product_payload.to_json,
          headers: {
            Authorization: "Bearer #{token.token}",
            'Content-Type': 'application/json'
          }

      expect(response).to have_http_status(:success)
      expect(product.reload.name).to eq(product_payload[:product][:name])
      expect(product.reload.price.to_s).to eq(product_payload[:product][:price].to_s)
    end
  end
end
