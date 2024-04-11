class AddErpOrderIdsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_orders, :erp_order_ids, :integer, array: true, default: []
  end
end
