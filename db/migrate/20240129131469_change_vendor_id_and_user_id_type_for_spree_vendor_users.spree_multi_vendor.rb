# This migration comes from spree_multi_vendor (originally 20210728120910)
class ChangeVendorIdAndUserIdTypeForSpreeVendorUsers < ActiveRecord::Migration[4.2]
  def up
    change_table(:spree_vendor_users) do |t|
      t.change :vendor_id, :bigint
      t.change :user_id, :bigint
    end
  end
  def down
    change_table(:spree_vendor_users) do |t|
      t.change :vendor_id, :integer
      t.change :user_id, :integer
    end
  end
end
