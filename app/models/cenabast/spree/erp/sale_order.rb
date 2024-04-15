class Cenabast::Spree::Erp::SaleOrder < Spree::Base
  self.table_name = 'cenabast_spree_erp_sale_orders'

  # Use Spree number generator related modules
  # to set the number parameter
  include ::Spree::Core::NumberGenerator.new(prefix: 'S')
  include ::Spree::NumberIdentifier
  include ::Spree::NumberAsParam

  belongs_to :order, class_name: '::Spree::Order', optional: false
  has_many :detail_lines, class_name: 'Cenabast::Spree::Erp::DetailLine', dependent: :destroy
  has_many :line_items, -> { distinct }, through: :detail_lines, class_name: '::Spree::LineItem'

  enum status: {
    initial: 0,
    sent: 1,
    failed: 2,
    nullified: 3,
    cancellation_pending: 4
  }

  def self.create_with_line_items!(line_items)
    return unless line_items.any?
    return unless (order = line_items&.first&.order)

    detail_lines = line_items.map do |line_item|
      Cenabast::Spree::Erp::DetailLine.new(
        line_item:
      )
    end
    sale_order = new(order:, detail_lines:)
    sale_order.save!

    sale_order
  end

  def send_to_erp!
    # Send to erp using job
    Cenabast::Spree::Erp::SendSaleOrderToErp.perform_later(self)
  end

  def cancel_in_erp!
    # Cancel in erp using job
    cancellation_pending!
    Cenabast::Spree::Erp::CancelSaleOrderInErp.perform_later(self)
  end
end
