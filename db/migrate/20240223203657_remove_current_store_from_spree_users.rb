class RemoveCurrentStoreFromSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :spree_users, :current_store, foreign_key: { to_table: :spree_stores }
  end
end
