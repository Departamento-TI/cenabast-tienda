class AddReceiverRefToOrder < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_orders, :cenabast_spree_receivers, foreign_key: true
  end
end
