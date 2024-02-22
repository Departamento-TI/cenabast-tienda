FactoryBot.define do
  factory :company_user, class: 'Cenabast::Spree::CompanyUser' do
    association :user, factory: :user
    company { Cenabast::Spree::Company.first || create(:company) }
  end
end
