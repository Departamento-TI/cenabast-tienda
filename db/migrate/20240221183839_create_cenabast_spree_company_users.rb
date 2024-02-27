class CreateCenabastSpreeCompanyUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_company_users do |t|
      t.references :user, null: false, foreign_key: { to_table: :spree_users }
      t.references :company, null: false, foreign_key: { to_table: :cenabast_spree_companies }

      t.timestamps
    end
  end
end
