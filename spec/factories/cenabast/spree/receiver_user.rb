FactoryBot.define do
  factory :receiver_user, class: 'Cenabast::Spree::ReceiverUser' do
    association :user, factory: :user
    association :receiver, factory: :receiver
  end
end
