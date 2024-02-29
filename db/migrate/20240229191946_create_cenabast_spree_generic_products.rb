class CreateCenabastSpreeGenericProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_generic_products do |t|
      t.string :code
      t.string :code_atc
      t.string :code_onu
      t.string :code_ean
      t.string :denomination
      t.string :standard_denomination
      t.integer :product_type
      t.string :hierarchy
      t.string :ump
      t.string :manufacturer
      t.string :base_table

      t.timestamps
    end
  end
end
