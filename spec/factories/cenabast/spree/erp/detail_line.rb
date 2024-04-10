FactoryBot.define do
  factory :erp_detail_line, class: 'Cenabast::Spree::Erp::DetailLine' do
    sale_order { Cenabast::Spree::Erp::SaleOrder || create(:erp_sale_order) }
    line_item { Spree::LineItem.first || create(:line_item) }
  end
end
