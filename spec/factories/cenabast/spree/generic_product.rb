FactoryBot.define do
  factory :generic_product, class: 'Cenabast::Spree::GenericProduct' do
    name { Faker::Alphanumeric.alpha(number: 8) }
    code { Faker::Alphanumeric.alpha(number: 8) }
    code_atc { Faker::Alphanumeric.alpha(number: 6) }
    code_onu { Faker::Alphanumeric.alpha(number: 6) }
    code_ean { Faker::Barcode.ean }
    denomination { Faker::Lorem.word }
    standard_denomination { Faker::Lorem.word }
    product_type { :generic }
    hierarchy { Faker::Lorem.word }
    ump { Faker::Lorem.word }
    manufacturer { Faker::Lorem.word }
    base_table { Faker::Lorem.word }
  end
end
