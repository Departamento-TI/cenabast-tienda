class AddEmailToSpreeAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_addresses, :email, :string
  end
end
