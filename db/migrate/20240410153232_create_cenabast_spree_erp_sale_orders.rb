class CreateCenabastSpreeErpSaleOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_erp_sale_orders do |t|
      t.string :number
      t.integer :status, default: 0, null: false

      t.string :erp_pedido_id
      t.string :erp_pv_id
      t.string :erp_fecha_creacion

      t.datetime :sent_at, null: true
      t.datetime :nullified_at, null: true

      t.references :order, null: false, foreign_key: { to_table: :spree_orders }

      t.timestamps
    end
  end
end
