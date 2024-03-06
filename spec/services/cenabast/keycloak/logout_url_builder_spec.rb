require 'rails_helper'
require 'uri'
require 'cgi'

RSpec.describe Cenabast::Keycloak::LogoutUrlBuilder do
  describe '#call' do
    context '#call - valid response' do
      before(:each) do
        VCR.insert_cassette 'cenabast/keycloak/logout_url_builder_valid', erb: true
      end

      after(:each) do
        VCR.eject_cassette
      end

      let(:response) { described_class.new.call }

      it 'returns a response with query params, and url' do
        uri = URI.parse(response)
        query_params = CGI.parse(uri.query)

        expect(query_params).to have_key('id_token_hint')
        expect(query_params).to have_key('post_logout_redirect_uri')

        expect(query_params['id_token_hint']).to_not be_empty
        expect(query_params['post_logout_redirect_uri']).to_not be_empty

        expect(query_params['post_logout_redirect_uri'][0]).to eq spree.new_spree_user_session_url
      end
    end
  end
end
