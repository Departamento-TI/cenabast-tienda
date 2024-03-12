class RemoveCenabastSpreeProviders < ActiveRecord::Migration[7.1]
  def change
    remove_index :cenabast_spree_contracts, column: :provider_id
    remove_column :cenabast_spree_contracts, :provider_id
    drop_table :cenabast_spree_providers
  end
end
