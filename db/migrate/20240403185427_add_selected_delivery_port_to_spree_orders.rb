class AddSelectedDeliveryPortToSpreeOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_orders, :selected_delivery_port, :string
  end
end
