class RemoveCenabastSpreeStoreUsers < ActiveRecord::Migration[7.1]
  def change
    remove_index :cenabast_spree_store_users, column: [:user_id, :store_id]
    drop_table :cenabast_spree_store_users
  end
end
