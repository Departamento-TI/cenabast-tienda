FactoryBot.modify do
  factory :order do
    receiver
    bill_address { create(:address) }
    ship_address { create(:address) }
  end
end
