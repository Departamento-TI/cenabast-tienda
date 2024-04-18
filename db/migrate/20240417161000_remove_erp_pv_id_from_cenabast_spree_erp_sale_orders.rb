class RemoveErpPvIdFromCenabastSpreeErpSaleOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :cenabast_spree_erp_sale_orders, :erp_pv_id
  end
end
