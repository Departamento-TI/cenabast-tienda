class AddCurrentStoreToSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_users, :current_store, foreign_key: { to_table: :spree_stores }
  end
end
