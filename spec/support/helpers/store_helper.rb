module Helpers
  module StoreHelper
    def create_cenabast_stores
      ecommerce_store = create(:store, code: 'spree-ecommerce', name: 'E-commerce')
      ecommerce_store.default = false
      ecommerce_store.checkout_zone = nil
      ecommerce_store.code = 'spree-ecommerce'
      ecommerce_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
      ecommerce_store.mail_from_address = 'no-reply@example.com'
      ecommerce_store.default_country = Spree::Country.find_by(iso: 'CL')
      ecommerce_store.supported_currencies = 'CLP'
      ecommerce_store.supported_locales = 'es'
      ecommerce_store.save!

      intermediation_store = create(:store, code: 'spree-intermediation', name: 'Intermediación')
      intermediation_store.default = false
      intermediation_store.checkout_zone = nil
      intermediation_store.code = 'spree-intermediation'
      intermediation_store.url = Rails.env.development? ? 'localhost:4000' : 'cenabast.com'
      intermediation_store.mail_from_address = 'no-reply@example.com'
      intermediation_store.default_country = Spree::Country.find_by(iso: 'CL')
      intermediation_store.supported_currencies = 'CLP'
      intermediation_store.supported_locales = 'es'
      intermediation_store.save!

      [ecommerce_store, intermediation_store]
    end

    def act_with_current_store(store)
      allow_any_instance_of(Spree::StoreController).to receive_messages current_store: store
    end
  end
end
