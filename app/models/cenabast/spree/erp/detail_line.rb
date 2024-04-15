class Cenabast::Spree::Erp::DetailLine < Spree::Base
  self.table_name = 'cenabast_spree_erp_detail_lines'

  belongs_to :sale_order, class_name: 'Cenabast::Spree::Erp::SaleOrder', optional: false
  belongs_to :line_item, class_name: '::Spree::LineItem', optional: false
end
