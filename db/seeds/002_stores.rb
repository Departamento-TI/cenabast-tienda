default_store = Spree::Store.default
default_store.default = true
default_store.name = 'E-commerce'
default_store.checkout_zone = nil
default_store.code = 'spree-ecommerce'
default_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
default_store.mail_from_address = 'no-reply@example.com'
default_store.default_country = Spree::Country.find_by(iso: 'CL')
default_store.default_currency = 'CLP'
default_store.supported_locales = 'es'
default_store.save!

intermediation_store = Spree::Store.find_or_initialize_by(code: 'spree-intermediation')
intermediation_store.default = false
intermediation_store.name = 'Intermediación'
intermediation_store.checkout_zone = nil
intermediation_store.code = 'spree-intermediation'
intermediation_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
intermediation_store.mail_from_address = 'no-reply@example.com'
intermediation_store.default_country = Spree::Country.find_by(iso: 'CL')
intermediation_store.default_currency = 'CLP'
intermediation_store.supported_locales = 'es'
intermediation_store.save!

# Destroy other stores that might exists
Spree::Store.where.not(code: ['spree-ecommerce', 'spree-intermediation']).destroy_all

Spree::PaymentMethod.find_each do |payment_method|
  payment_method.stores = Spree::Store.all
end

if defined?(Spree::StoreProduct) && Spree::Product.method_defined?(:stores)
  Spree::Product.find_each do |product|
    product.store_ids = Spree::Store.ids
    product.save
  end
end
