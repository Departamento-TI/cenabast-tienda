module Helpers
  module StoreHelper
    def create_cenabast_stores
      default_store = create(:store, code: 'spree-ecommerce')
      default_store.default = false
      default_store.name = 'E-commerce'
      default_store.checkout_zone = nil
      default_store.code = 'spree-ecommerce'
      default_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
      default_store.mail_from_address = 'no-reply@example.com'
      default_store.default_country = Spree::Country.find_by(iso: 'CL')
      default_store.supported_currencies = 'CLP'
      default_store.supported_locales = 'es'
      default_store.save!

      intermediation_store = create(:store, code: 'spree-intermediation')
      intermediation_store.default = false
      intermediation_store.name = 'Intermediación'
      intermediation_store.checkout_zone = nil
      intermediation_store.code = 'spree-intermediation'
      intermediation_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
      intermediation_store.mail_from_address = 'no-reply@example.com'
      intermediation_store.default_country = Spree::Country.find_by(iso: 'CL')
      intermediation_store.supported_currencies = 'CLP'
      intermediation_store.supported_locales = 'es'
      intermediation_store.save!
    end
  end
end
