class RemoveUniqueEmailIndexFromSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    remove_index :spree_users, name: "email_idx_unique"
  end
end
