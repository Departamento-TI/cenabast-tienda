FactoryBot.define do
  factory :contract, class: 'Cenabast::Spree::Contract' do
    sale_order { Faker::Alphanumeric.alpha(number: 10) }
    code { Faker::Alphanumeric.alpha(number: 8) }
    name { Faker::Lorem.word }
    mercado_publico_id { Faker::Alphanumeric.alpha(number: 6) }
    mercado_publico_oc { Faker::Alphanumeric.alpha(number: 8) }
    center { Faker::Number.between(from: 1, to: 10) }
    price_before_iva { Faker::Commerce.price(range: 10..100) }
    price_iva { Faker::Commerce.price(range: 1..10) }
    price { Faker::Commerce.price(range: 50..200) }
    comission { Faker::Commerce.price(range: 1..5) }
    available_on { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    discontinue_on { Faker::Date.between(from: Date.tomorrow, to: 2.years.from_now) }
    unit_sale { Faker::Lorem.word }
    unit { Faker::Lorem.word }

    product { Spree::Product.first || create(:product) }
    provider { Cenabast::Spree::Provider.first || create(:provider) }
  end
end
