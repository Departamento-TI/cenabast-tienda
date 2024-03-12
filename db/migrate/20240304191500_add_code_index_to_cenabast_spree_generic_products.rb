class AddCodeIndexToCenabastSpreeGenericProducts < ActiveRecord::Migration[7.1]
  def change
    add_index :cenabast_spree_generic_products, :code, unique: true
  end
end
