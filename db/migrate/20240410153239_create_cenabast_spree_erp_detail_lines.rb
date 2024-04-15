class CreateCenabastSpreeErpDetailLines < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_erp_detail_lines do |t|

      t.references :sale_order, null: false, foreign_key: { to_table: :cenabast_spree_erp_sale_orders }
      t.references :line_item, null: false, foreign_key: { to_table: :spree_line_items }

      t.timestamps
    end
  end
end
