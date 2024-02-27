class CreateCenabastSpreeCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_companies do |t|
      t.string :run
      t.string :name
      t.boolean :active, :boolean, default: false, null: false

      t.timestamps
    end
  end
end
