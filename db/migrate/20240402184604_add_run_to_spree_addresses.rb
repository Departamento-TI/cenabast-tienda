class AddRunToSpreeAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_addresses, :run, :string
  end
end
