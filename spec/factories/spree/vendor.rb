FactoryBot.define do
  factory :vendor, class: Spree::Vendor do
    name { Faker::Alphanumeric.alpha(number: 12) }
    about_us { 'About us...' }
    contact_us { 'Contact us...' }

    run { Spree::Vendor.raw_run_to_formatted(Faker::ChileRut.rut.to_s) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    land_phone { Faker::PhoneNumber.phone_number }
    mobile_phone { Faker::PhoneNumber.cell_phone }

    factory :active_vendor do
      name { 'Active vendor' }
      state { :active }
    end

    factory :active_vendor_list do
      name { "#{Faker::Company.name} #{Faker::Company.suffix}" }
      state { :active }
    end

    factory :pending_vendor do
      name { 'Pending vendor' }
      state { :pending }
    end

    factory :blocked_vendor do
      name { 'Blocked vendor' }
      state { :blocked }
    end
  end
end
