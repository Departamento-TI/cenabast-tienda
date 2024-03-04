class RemoveUnusedUserTypeFromSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :spree_users, :user_type, :integer
  end
end
