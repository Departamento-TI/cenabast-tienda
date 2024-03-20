FactoryBot.define do
  factory :cenabast_product, parent: :product do
    contract { Cenabast::Spree::Contract.first || create(:contract) }
    association :generic_product
  end
end
