class AddReceiverRefToOrder < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_orders, :receiver, foreign_key: { to_table: :cenabast_spree_receivers }
  end
end
