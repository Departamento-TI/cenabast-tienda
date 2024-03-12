class AddGenericProductReferenceToSpreeProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_products, :generic_product, null: true, foreign_key: { to_table: :cenabast_spree_generic_products }
  end
end
