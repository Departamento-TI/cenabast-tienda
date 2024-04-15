FactoryBot.define do
  factory :vendor_user, class: 'Spree::VendorUser' do
    user
    vendor
  end
end
