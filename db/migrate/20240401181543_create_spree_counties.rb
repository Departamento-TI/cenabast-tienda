class CreateSpreeCounties < ActiveRecord::Migration[7.1]
  def change
    create_table :spree_counties do |t|
      t.string :name
      t.string :code
      t.references :state, index: true, foreign_key: { to_table: :spree_states }

      t.timestamps
    end
  end
end
