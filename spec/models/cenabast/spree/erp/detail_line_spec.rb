require 'rails_helper'

RSpec.describe Cenabast::Spree::Erp::DetailLine, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:sale_order).class_name('Cenabast::Spree::Erp::SaleOrder').optional(false) }
    it { is_expected.to belong_to(:line_item).class_name('Spree::LineItem').optional(false) }
  end
end
