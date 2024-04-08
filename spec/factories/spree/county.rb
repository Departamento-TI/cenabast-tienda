FactoryBot.define do
  factory :county, class: Spree::County do
    name { Faker::Name.first_name }
    code { Faker::Alphanumeric.alpha(number: 6) }
    state { Spree::State.last || create(:state) }
  end
end
