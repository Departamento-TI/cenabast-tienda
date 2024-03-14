require 'rails_helper'

RSpec.describe Cenabast::Spree::Api::V2::Platform::ContractsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get api_v2_platform_contracts_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about contracts' do
      contract = create(:contract)

      get api_v2_platform_contracts_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(contract.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['sale_order']).to eq(contract.sale_order)
      expect(attributes['code']).to eq(contract.code)
      expect(attributes['name']).to eq(contract.name)
      expect(attributes['mercado_publico_oc']).to eq(contract.mercado_publico_oc)
      expect(attributes['center']).to eq(contract.center)
      expect(attributes['price_before_iva']).to eq(contract.price_before_iva.to_s)
      expect(attributes['price_iva']).to eq(contract.price_iva.to_s)
      expect(attributes['price']).to eq(contract.price.to_s)
      expect(attributes['comission']).to eq(contract.comission.to_s)
      expect(attributes['unit_sale']).to eq(contract.unit_sale)
      expect(attributes['unit']).to eq(contract.unit)
      expect(attributes['quantity']).to eq(contract.quantity)
      expect(attributes['mercado_publico_id']).to eq(contract.mercado_publico_id)
      expect(attributes['product_id']).to eq(contract.product_id)

      expect(attributes['available_on']).not_to be_nil
      expect(attributes['discontinue_on']).not_to be_nil
      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one contract' do
      contracts = create_list(:contract, rand(2..4))

      get api_v2_platform_contracts_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(contracts.count)
    end

    it 'can filter using ransack to only show one contract in particular' do
      contracts = create_list(:contract, rand(2..4))
      contract = contracts.sample
      get api_v2_platform_contracts_path('filter[code_eq]': contract.code), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
    end
  end

  describe 'POST #create' do
    let(:product) { create(:product) }
    let(:contract_payload) do
      {
        contract: {
          sale_order: 'Testing sale order',
          code: 'new-contract-code',
          name: 'qui',
          mercado_publico_oc: 'oc-test-1234',
          center: 2,
          price_before_iva: '21.0',
          price_iva: '10.0',
          price: '137.0',
          comission: '5.0',
          unit_sale: 'test',
          unit: 'test',
          product_id: product.id
        }
      }
    end

    it 'creates a new contract from payload' do
      expect do
        post api_v2_platform_contracts_path, params: contract_payload, headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Cenabast::Spree::Contract, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(product.contract).not_to be_nil
      expect(product.contract.code).to eq(contract_payload[:contract][:code])
    end
  end

  describe 'PUT #update' do
    let(:product) { create(:product) }
    let!(:contract) { create(:contract, product:) }
    let(:contract_payload) do
      {
        contract: {
          code: 'new-contract-code-edited'
        }
      }
    end

    it 'edits a contract from payload' do
      expect do
        put api_v2_platform_contract_path(contract), params: contract_payload, headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Cenabast::Spree::Contract, :count).by(0)

      expect(response).to have_http_status(:success)
      expect(contract.reload.code).to eq(contract_payload[:contract][:code])
    end
  end
end
