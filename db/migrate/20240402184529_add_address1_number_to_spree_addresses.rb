class AddAddress1NumberToSpreeAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_addresses, :address1_number, :string
  end
end
