class AddCodeIndexToCenabastSpreeContracts < ActiveRecord::Migration[7.1]
  def change
    add_index :cenabast_spree_contracts, :code, unique: true
  end
end
