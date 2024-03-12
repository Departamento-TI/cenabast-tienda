class CreateCenabastSpreeContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_contracts do |t|
      t.references :product, null: false, foreign_key: { to_table: :spree_products }
      t.references :provider, null: false, foreign_key: { to_table: :cenabast_spree_providers }

      t.string :sale_order
      t.string :code
      t.string :name
      t.string :mercado_publico_id
      t.string :mercado_publico_oc
      t.integer :center
      t.decimal :price_before_iva
      t.decimal :price_iva
      t.decimal :price
      t.decimal :comission
      t.datetime :available_on
      t.datetime :discontinue_on
      t.string :unit_sale
      t.string :unit

      t.timestamps
    end
  end
end
