require 'rails_helper'

RSpec.describe Cenabast::Spree::User::CompaniesInformationProcesser, type: :model do
  describe '#call - valid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/companies_information_processer_valid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '8962580' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'creates a model Spree::Company that links to the given user RUN' do
      described_class.new(run).call

      company = Cenabast::Spree::Company.last
      expect(company.users.first.run).to eq formatted_run
    end

    it 'increases the count Spree::Company for the user by 1' do
      expect do
        described_class.new(run).call
      end.to change(user.reload.companies, :count).by(1)
    end

    describe 'companies already exists' do
      before(:each) do
        create(:company, run: '761913891')
      end

      it 'mantains the count Spree::Company as the same' do
        expect do
          described_class.new(run).call
        end.to change(Cenabast::Spree::Company, :count).by(0)
      end

      it 'stills increases the count Cenabast::Spree::CompanyUser as it wasnt linked' do
        expect do
          described_class.new(run).call
        end.to change(Cenabast::Spree::CompanyUser, :count).by(1)
      end
    end

    describe 'company exists, is not on the response' do
      let!(:company) { create(:company, run: '631249833') }
      let!(:company_user) { create(:company_user, company:, user:) }

      it 'destroys the Cenabast::Spree::CompanyUser record as its no longer valid' do
        described_class.new(run).call

        expect(Cenabast::Spree::CompanyUser.exists?(company_user.id)).to eq false
      end

      it 'mantains the Spree::Company record' do
        described_class.new(run).call

        expect(Cenabast::Spree::Company.exists?(company.id)).to eq true
      end
    end
  end

  describe '#call - invalid run, existing user' do
    before(:each) do
      VCR.insert_cassette 'cenabast/spree/user/companies_information_processer_invalid'
    end

    after(:each) do
      VCR.eject_cassette
    end

    let(:run) { '18605956' }
    let(:formatted_run) { Spree::User.raw_run_to_formatted(run) }
    let!(:user) { create(:user, run: formatted_run) }

    it 'mantains the count Cenabast::Spree::Company as the same, no companies were created' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::Company, :count).by(0)
    end

    it 'mantains the count Cenabast::Spree::CompanyUser as the same, no companies-user links were created' do
      expect do
        described_class.new(run).call
      end.to change(Cenabast::Spree::CompanyUser, :count).by(0)
    end
  end
end
