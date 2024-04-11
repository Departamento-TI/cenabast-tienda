class RenameAddressSubstepToOrderSubstepInSpreeOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :spree_orders, :address_substep, :order_substep
  end
end
