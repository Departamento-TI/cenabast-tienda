class CreateCenabastSpreeRequesters < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_requesters do |t|
      t.string :run
      t.string :name

      t.timestamps
    end
  end
end
