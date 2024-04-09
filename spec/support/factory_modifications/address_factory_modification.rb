FactoryBot.modify do
  factory :address do
    county { Spree::County.last || create(:county) }
    run { Spree::Address.raw_run_to_formatted(Faker::ChileRut.rut.to_s) }

    after(:build) do |address|
      address.county.update(state: address.state)
    end
  end
end