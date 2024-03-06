require 'rails_helper'

RSpec.describe Cenabast::Keycloak::TokenFetcher do
  describe '#call' do
    context '#call - valid response' do
      before(:each) do
        VCR.insert_cassette 'cenabast/keycloak/token_fetch_valid', erb: true
      end

      after(:each) do
        VCR.eject_cassette
      end

      let(:response) { described_class.new.call }

      it 'returns a response with a http_code' do
        expect(response&.dig(:http_code)).to eq 200
      end

      it 'returns a response with a success status' do
        expect(response&.dig(:success)).to eq true
      end

      it 'returns a response with a id_token' do
        expect(response&.dig(:id_token)).not_to be_nil
      end
    end

    context '#call - invalid response' do
      before(:each) do
        VCR.insert_cassette 'cenabast/keycloak/token_fetch_invalid', erb: true
      end

      after(:each) do
        VCR.eject_cassette
      end

      let(:response) { described_class.new.call }

      it 'returns a response with a http_code' do
        expect(response&.dig(:http_code)).not_to eq 200
      end

      it 'returns a response with a success status' do
        expect(response&.dig(:success)).to eq false
      end

      it 'returns a response with a id_token' do
        expect(response&.dig(:id_token)).to be_nil
      end
    end
  end
end
