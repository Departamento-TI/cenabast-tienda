class DropCenabastSpreeCompanyUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :cenabast_spree_company_users
  end
end
