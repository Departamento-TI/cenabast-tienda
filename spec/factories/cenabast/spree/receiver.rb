FactoryBot.define do
  factory :receiver, class: 'Cenabast::Spree::Receiver' do
    run { Cenabast::Spree::Receiver.raw_run_to_formatted(Faker::ChileRut.rut.to_s) }
    name { 'Receiver Name' }
    address { 'Test Address #123' }
    channel_type { :intermediacion }
    store { Spree::Store.first || create(:store) }

    requester { Cenabast::Spree::Requester.first || create(:requester) }
  end
end
