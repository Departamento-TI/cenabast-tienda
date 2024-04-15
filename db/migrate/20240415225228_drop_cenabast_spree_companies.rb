class DropCenabastSpreeCompanies < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :cenabast_spree_company_users, :cenabast_spree_companies
    drop_table :cenabast_spree_companies, if_exists: true
  end
end
