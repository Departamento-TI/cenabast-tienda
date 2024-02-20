class AddContactAndActivityInformationToSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_users, :run, :string
    add_column :spree_users, :land_phone, :string
    add_column :spree_users, :mobile_phone, :string
    add_column :spree_users, :active, :boolean, default: false, null: false
    add_column :spree_users, :user_type, :integer, default: 0
  end
end
