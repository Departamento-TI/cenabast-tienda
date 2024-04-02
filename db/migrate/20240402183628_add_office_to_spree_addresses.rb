class AddOfficeToSpreeAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_addresses, :office, :string
  end
end
