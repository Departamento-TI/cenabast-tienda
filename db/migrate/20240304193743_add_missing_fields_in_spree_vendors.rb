class AddMissingFieldsInSpreeVendors < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_vendors, :run, :string
    add_column :spree_vendors, :first_name, :string
    add_column :spree_vendors, :last_name, :string
    add_column :spree_vendors, :email, :string
    add_column :spree_vendors, :land_phone, :string
    add_column :spree_vendors, :mobile_phone, :string
  end
end
