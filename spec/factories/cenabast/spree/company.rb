FactoryBot.define do
  factory :company, class: 'Cenabast::Spree::Company' do
    run { '11.111.111-1' }
    name { 'Company Name' }
    active { false }
  end
end
