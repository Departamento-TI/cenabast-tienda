class AddQuantityColumnToCenabastSpreeContracts < ActiveRecord::Migration[7.1]
  def change
    add_column :cenabast_spree_contracts, :quantity, :integer, null: false, default: 0
  end
end
