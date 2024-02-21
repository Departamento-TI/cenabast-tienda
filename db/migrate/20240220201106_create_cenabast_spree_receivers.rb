class CreateCenabastSpreeReceivers < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_receivers do |t|
      t.string :run
      t.string :name
      t.string :address
      t.integer :channel_type, default: 0
      t.references :requester, null: false, foreign_key: { to_table: :cenabast_spree_requesters }

      t.timestamps
    end
  end
end
