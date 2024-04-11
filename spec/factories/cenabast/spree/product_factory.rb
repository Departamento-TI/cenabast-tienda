FactoryBot.define do
  factory :cenabast_product, parent: :product do
    contract { Cenabast::Spree::Contract.first || create(:contract) }
    association :generic_product
    currency { 'CLP' }

    factory :cenabast_product_in_stock do
      after :create do |product|
        product.master.stock_items.first.adjust_count_on_hand(10)
      end
    end
  end
end
