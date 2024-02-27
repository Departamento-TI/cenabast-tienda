FactoryBot.define do
  factory :receiver, class: 'Cenabast::Spree::Receiver' do
    run { '11.111.111-1' }
    name { 'Receiver Name' }
    address { 'Test Address #123' }
    channel_type { :intermediacion }
    store { Spree::Store.first || create(:store) }

    requester { Cenabast::Spree::Requester.first || create(:requester) }
  end
end
