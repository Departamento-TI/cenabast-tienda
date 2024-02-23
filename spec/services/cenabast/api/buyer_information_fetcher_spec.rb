require 'rails_helper'

RSpec.describe Cenabast::Api::BuyerInformationFetcher do
  describe '#call - valid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/buyer_information_valid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '16338556' }
    let(:response) { described_class.new(run).call }

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

  describe '#call - invalid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/buyer_information_invalid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '12338526' }
    let(:response) { described_class.new(run).call }

    it 'returns a response with a http_code' do
      expect(response&.dig(:http_code)).not_to eq 200
    end

    it 'returns a response with a success status' do
      expect(response&.dig(:success)).to eq false
    end

    it 'returns a response_content with an error response_body' do
      expect(response&.dig(:response_content)).to eq('Usuario no encontrado.')
    end
  end
end
