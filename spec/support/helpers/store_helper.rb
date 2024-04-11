module Helpers
  module StoreHelper
    def create_cenabast_stores
      # Ensure Chile exists as a country
      Spree::Country.find_or_create_by(
        name: 'Chile', iso_name: 'CHILE',
        iso: 'CL', iso3: 'CHL', numcode: 152,
        states_required: true, zipcode_required: false
      )

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

    # Create some sample values to use
    def create_states_and_counties
      country = Spree::Country.find_by(iso: 'CL')
      state = create(:state, country:, name: 'Región Metropolitana de Santiago')
      create(:county, state:, name: 'Renca')
      create(:county, state:, name: 'Santiago')
      create(:county, state:, name: 'San Bernardo')
    end

    # Create shipping methods to use
    def create_shipping_methods
      load Rails.root.join('db/seeds/005_shipping_methods.rb')
    end

    def act_with_current_store(store)
      allow_any_instance_of(Spree::StoreController).to receive_messages current_store: store
    end
  end
end
