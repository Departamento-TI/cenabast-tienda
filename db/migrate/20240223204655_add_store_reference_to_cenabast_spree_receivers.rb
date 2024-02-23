class AddStoreReferenceToCenabastSpreeReceivers < ActiveRecord::Migration[7.1]
  def change
    add_reference :cenabast_spree_receivers, :store, foreign_key: { to_table: :spree_stores }
  end
end
