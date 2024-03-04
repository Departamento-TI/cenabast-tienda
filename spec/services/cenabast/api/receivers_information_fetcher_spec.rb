require 'rails_helper'

RSpec.describe Cenabast::Api::ReceiversInformationFetcher do
  describe '#call - valid run' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/receivers_information_valid', erb: true
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

    it 'returns a response_body with an hash of values' do
      expect(response&.dig(:response_body)&.class).to eq Hash
    end

    it 'returns a response_content with an array of values' do
      expect(response&.dig(:response_content)&.class).to eq Array
    end
  end

  describe '#call - run with no receivers' do
    before(:each) do
      VCR.insert_cassette 'cenabast/api/receivers_information_no_receivers', erb: true
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

    it 'returns a response_content with an empty array' do
      expect(response&.dig(:response_content)).to eq([])
    end
  end
end
