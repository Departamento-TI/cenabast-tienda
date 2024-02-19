require 'rails_helper'

RSpec.describe Cenabast::Api::TokenFetcher do
  describe '#call' do
    before(:each) do
      VCR.insert_cassette 'cenabast_api_token'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:response) { subject.call }

    it 'returns a response with a token' do
      expect(response&.dig(:token)).not_to be_nil
    end

    it 'returns a response with a http_code' do
      expect(response&.dig(:http_code)).to eq 200
    end

    it 'returns a response with a success status' do
      expect(response&.dig(:success)).to eq true
    end

    it 'returns a response with a complete response_body' do
      expect(response&.dig(:response_body)).not_to be_nil
    end
  end
end
