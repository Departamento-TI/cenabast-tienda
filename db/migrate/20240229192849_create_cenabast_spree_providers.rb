class CreateCenabastSpreeProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_providers do |t|
      t.string :name
      t.string :run
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :land_phone
      t.string :mobile_phone

      t.timestamps
    end
  end
end
