require 'rails_helper'

RSpec.describe Spree::Api::V2::Platform::TaxonsController, type: :request do
  let(:admin) { create(:admin_user) }
  let(:token) { generate_token_for(admin) }

  before(:each) do
    @stores = create_cenabast_stores
    @stores.first.update(default: true)
    admin.toggle_store(@stores.first)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get spree.api_v2_platform_taxons_path, headers: { Authorization: "Bearer #{token.token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns information about taxons' do
      taxon = create(:taxonomy).root

      get spree.api_v2_platform_taxons_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
      expect(response.parsed_body['data'][0]['id']).to eq(taxon.id.to_s)

      attributes = response.parsed_body['data'][0]['attributes']

      expect(attributes['name']).to eq(taxon.name)
      expect(attributes['permalink']).to eq(taxon.permalink)
      expect(attributes['description']).to eq(taxon.description)
      expect(attributes['position']).to eq(taxon.position)
      expect(attributes['lft']).to eq(taxon.lft)
      expect(attributes['rgt']).to eq(taxon.rgt)
      expect(attributes['depth']).to eq(taxon.depth)
      expect(attributes['pretty_name']).to eq(taxon.pretty_name)
      expect(attributes['seo_title']).to eq(taxon.seo_title)

      # Add more expectations for taxon attributes if needed

      expect(attributes['created_at']).not_to be_nil
      expect(attributes['updated_at']).not_to be_nil
    end

    it 'can return more than one taxon' do
      taxons = create_list(:taxonomy, rand(2..4)).map(&:root)

      get spree.api_v2_platform_taxons_path, headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(taxons.count)
    end

    it 'can filter using ransack to only show one taxon in particular' do
      taxons = create_list(:taxonomy, rand(2..4), root: build(:taxon, name: Faker::Lorem.word, parent_id: nil)).map(&:root)
      taxon = taxons.sample
      get spree.api_v2_platform_taxons_path('filter[name_eq]': taxon.name), headers: { Authorization: "Bearer #{token.token}" }

      expect(response.parsed_body['data'].count).to eq(1)
    end
  end

  describe 'POST #create' do
    let!(:taxonomy) { create(:taxonomy) }
    let!(:taxon_payload) do
      {
        taxon: {
          name: 'Medicamentos 2 - Edited',
          taxonomy_id: taxonomy.id,
          parent_id: taxonomy.root.id
        }
      }
    end

    it 'creates a new contract from payload' do
      expect do
        post spree.api_v2_platform_taxons_path, params: taxon_payload, headers: { Authorization: "Bearer #{token.token}" }
      end.to change(Spree::Taxon, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(Spree::Taxon.last.name).not_to be_nil
      expect(Spree::Taxon.last.name).to eq(taxon_payload[:taxon][:name])
      expect(Spree::Taxon.last.taxonomy).to eq(taxonomy)
    end
  end

  describe 'PUT #update' do
    let(:taxon) { create(:taxon) }
    let(:taxon_payload) do
      {
        taxon: {
          name: 'Medicamentos 2 - Edited'
        }
      }
    end

    it 'updates a taxon with the given attributes' do
      put spree.api_v2_platform_taxon_path(id: taxon.id),
          params: taxon_payload.to_json,
          headers: {
            'Authorization' => "Bearer #{token.token}",
            'Content-Type' => 'application/json'
          }

      expect(response).to have_http_status(:success)
      expect(taxon.reload.name).to eq(taxon_payload[:taxon][:name])
    end
  end
end
