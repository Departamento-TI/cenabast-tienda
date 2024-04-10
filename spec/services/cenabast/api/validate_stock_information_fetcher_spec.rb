require 'rails_helper'

RSpec.describe Cenabast::Api::ValidateStockInformationFetcher do
  describe '#call - valid server response' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/validate_stock_information_valid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:sku) { '500006843' }
    let(:response) { described_class.new(sku).call }

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

  describe '#call - invalid server response' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/validate_stock_information_invalid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:sku) { '500006843' }
    let(:response) { described_class.new(sku).call }

    it 'returns a response with a http_code' do
      expect(response&.dig(:http_code)).not_to eq 200
    end

    it 'returns a response with a success status' do
      expect(response&.dig(:success)).to eq false
    end

    it 'returns a response with a complete response_body' do
      expect(response&.dig(:response_body)).not_to be_nil
    end
  end
end
