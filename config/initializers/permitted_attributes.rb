# Add permitted attributes to address for county handling
Spree::PermittedAttributes.address_attributes << :county_id
# Add other related Cenabast attributes
Spree::PermittedAttributes.address_attributes << [:run, :email, :address1_number, :office]
