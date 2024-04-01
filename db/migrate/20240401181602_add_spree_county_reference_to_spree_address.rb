class AddSpreeCountyReferenceToSpreeAddress < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_addresses, :county, index: true
  end
end
