# Based on implementation found
# https://stackoverflow.com/a/36844697
# This allows us to remove some column related validations
# that are added in other gems
module Cenabast
  module Spree
    module CancelValidation
      extend ActiveSupport::Concern

      included do
        def self.cancel_validates *attributes
          attributes.each do |attribute|
            _validators.delete(attribute)

            filtered_callbacks = _validate_callbacks.select do |callback|
              callback.filter.try(:attributes) == [attribute]
            end

            filtered_callbacks.each do |callback|
              _validate_callbacks.delete(callback)
            end
          end
        end
      end
    end
  end
end
