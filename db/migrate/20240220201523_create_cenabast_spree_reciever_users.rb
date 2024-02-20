class CreateCenabastSpreeRecieverUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :cenabast_spree_reciever_users do |t|
      t.references :user, null: false, foreign_key: { to_table: :spree_users }
      t.references :reciever, null: false, foreign_key: { to_table: :cenabast_spree_recievers }

      t.string :cenabast_id_relationship

      t.timestamps
    end
  end
end
