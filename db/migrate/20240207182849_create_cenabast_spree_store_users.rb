class CreateCenabastSpreeStoreUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_store_users do |t|
      t.references :user, null: false, foreign_key: { to_table: :spree_users }
      t.references :store, null: false, foreign_key: { to_table: :spree_stores }

      t.timestamps
    end

    unless index_exists?(:cenabast_spree_store_users, [:user_id, :store_id])
      add_index :cenabast_spree_store_users, [:user_id, :store_id]
    end
  end
end
