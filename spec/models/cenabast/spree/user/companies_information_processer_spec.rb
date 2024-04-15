require 'rails_helper'

RSpec.describe Cenabast::Spree::User::CompaniesInformationProcesser, type: :model do
  before(:each) do
    create_cenabast_stores
  end

  describe '#call - valid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/companies_information_processer_valid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '8962580' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'creates a model Spree::Vendor that links to the given user RUN' do
      described_class.new(run).call

      vendor = Spree::Vendor.last
      expect(vendor.users).to include(user)
    end

    it 'increases the count Spree::Vendor for the user by 1' do
      expect do
        described_class.new(run).call
      end.to change(user.reload.vendors, :count).by(1)
    end

    describe 'Vendors already exists' do
      before(:each) do
        create(:vendor, run: '761913891')
      end

      it 'mantains the count Spree::Vendor as the same' do
        expect do
          described_class.new(run).call
        end.to change(Spree::Vendor, :count).by(0)
      end

      it 'stills increases the count ::Spree::VendorUser as it wasnt linked' do
        expect do
          described_class.new(run).call
        end.to change(Spree::VendorUser, :count).by(1)
      end
    end

    describe 'vendor exists, is not on the response' do
      let!(:vendor) { create(:vendor, run: '631249833') }
      let!(:vendor_user) { create(:vendor_user, vendor:, user:) }

      it 'destroys the ::Spree::VendorUser record as its no longer valid' do
        described_class.new(run).call

        expect(Spree::VendorUser.exists?(vendor_user.id)).to eq false
      end

      it 'mantains the Spree::Vendor record' do
        described_class.new(run).call

        expect(Spree::Vendor.exists?(vendor.id)).to eq true
      end
    end
  end

  describe '#call - invalid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/companies_information_processer_invalid', erb: true
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '18605956' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'mantains the count ::Spree::Vendor as the same, no companies were created' do
      expect do
        described_class.new(run).call
      end.to change(Spree::Vendor, :count).by(0)
    end

    it 'mantains the count ::Spree::VendorUser as the same, no vendors-user links were created' do
      expect do
        described_class.new(run).call
      end.to change(Spree::VendorUser, :count).by(0)
    end
  end
end
