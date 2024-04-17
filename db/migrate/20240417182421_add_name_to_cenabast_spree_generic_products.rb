class AddNameToCenabastSpreeGenericProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :cenabast_spree_generic_products, :name, :string
  end
end
