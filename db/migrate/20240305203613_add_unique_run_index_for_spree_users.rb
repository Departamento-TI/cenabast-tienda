class AddUniqueRunIndexForSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :spree_users, :run, unique: true
  end
end
