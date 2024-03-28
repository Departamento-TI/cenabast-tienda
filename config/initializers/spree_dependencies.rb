# Change the way the current store is search amongst the project
# Using Cenabast::Spree::Stores::FindCurrent

Spree.dependencies do |dependencies|
  dependencies.current_store_finder = 'Cenabast::Spree::Stores::FindCurrent'
  dependencies.current_order_finder = 'Cenabast::Spree::Orders::FindCurrent'
  dependencies.cart_create_service = 'Cenabast::Spree::Cart::Create'
end
