# Based on code from spree_county gem
module Cenabast
  module Spree
    module HasCounty
      extend ActiveSupport::Concern

      included do
        belongs_to :county, class_name: 'Spree::County', optional: true
        validate :county_validate

        private

        def validate_state_belongs_to_country?
          return true unless state
          return true if state&.country == country

          errors.add(:state, :invalid)
        end

        def validate_county_belongs_to_state?
          return true unless county
          return true if county&.state == state

          errors.add(:county, :invalid)
        end

        def county_validate
          validate_state_belongs_to_country?
          validate_county_belongs_to_state?
        end
      end
    end
  end
end
