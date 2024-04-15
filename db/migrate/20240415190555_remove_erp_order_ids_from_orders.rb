class RemoveErpOrderIdsFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :spree_orders, :erp_order_ids
  end
end
