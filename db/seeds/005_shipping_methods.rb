# Make sure Chile zone exists
zone = Spree::Zone.find_or_create_by(
  name: 'Chile',
  description: 'Zone of type country with Chile allowed',
  kind: 'country'
)
chile = Spree::Country.find_by(iso: 'CL')
Spree::ZoneMember.find_or_create_by(
  zoneable_type: 'Spree::Country',
  zone:,
  zoneable_id: chile.id
)

# Find Shipping category
shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'Default')

# Create Shipping method
attributes = {
  name: 'Despacho Gratis',
  zones: [zone],
  display_on: 'both',
  shipping_categories: [shipping_category]
}

shipping_method = Spree::ShippingMethod.where(name: attributes[:name]).first_or_create! do |record|
  record.calculator = Spree::Calculator::Shipping::FlatRate.create!
  record.zones = attributes[:zones]
  record.display_on = attributes[:display_on]
  record.shipping_categories = attributes[:shipping_categories]
end

shipping_method.calculator.preferences = {
  amount: 0,
  currency: 'CLP'
}
