FactoryBot.define do
  factory :requester, class: 'Cenabast::Spree::Requester' do
    run { '11.111.111-1' }
    name { 'Requester Name' }
  end
end
