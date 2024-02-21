require 'rails_helper'

RSpec.describe Cenabast::Api::ReceiversInformationFetcher do
  describe '#call - valid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast_api_receivers_information_valid'
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

    it 'returns a response_body with an array of receivers' do
      expect(response&.dig(:response_body)&.class).to eq Array
    end
  end

  describe '#call - run with no receivers' do
    before(:each) do
      VCR.insert_cassette 'cenabast_api_receivers_information_no_receivers'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '12338526' }
    let(:response) { described_class.new(run).call }

    it 'returns a response with a http_code' do
      expect(response&.dig(:http_code)).to eq 200
    end

    it 'returns a response with a success status' do
      expect(response&.dig(:success)).to eq true
    end

    it 'returns a response with an empty array response_body' do
      expect(response&.dig(:response_body)).to eq([])
    end
  end
end
