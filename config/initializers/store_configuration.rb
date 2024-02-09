# Change the way the current store is search amongst the project
# Using Cenabast::Spree::Stores::FindCurrent

Spree.dependencies do |dependencies|
  dependencies.current_store_finder = 'Cenabast::Spree::Stores::FindCurrent'
end
