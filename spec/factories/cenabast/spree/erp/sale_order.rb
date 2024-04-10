FactoryBot.define do
  factory :erp_sale_order, class: 'Cenabast::Spree::Erp::SaleOrder' do
    status { 'initial' }
    order { Spree::Order.first || create(:order) }
  end
end
