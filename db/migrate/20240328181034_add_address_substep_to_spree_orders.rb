class AddAddressSubstepToSpreeOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_orders, :address_substep, :integer, default: 0, null: false
  end
end
