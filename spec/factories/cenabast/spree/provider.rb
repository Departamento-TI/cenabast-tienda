FactoryBot.define do
  factory :cenabast_spree_provider, class: 'Cenabast::Spree::Provider' do
    name { Faker::Company.name }
    run { Faker::ChileRut.rut }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    land_phone { Faker::PhoneNumber.phone_number }
    mobile_phone { Faker::PhoneNumber.cell_phone }
  end
end
