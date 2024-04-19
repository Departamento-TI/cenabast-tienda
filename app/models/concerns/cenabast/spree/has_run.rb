# Concern for adding RUN related logic to a model
# This assumes the model has a field called run to store the run data.
# Based on https://github.com/mihailpozarski/chilean-rutify
module Cenabast
  module Spree
    module HasRun
      class CenabastRunValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          return if value.blank?
          return if Chilean::Rutify.valid_rut?(value)

          record.errors.add(attribute, :invalid)
        end
      end

      extend ActiveSupport::Concern

      included do
        validates :run, presence: true, cenabast_run: true

        def self.raw_run_to_formatted(value)
          Chilean::Rutify.normalize_rut(value.to_s + Chilean::Rutify.get_verifier(value))
        rescue StandardError => e
          Rails.logger.error "Exception raised formatting run: #{e.message}"
          nil
        end
      end

      def raw_run
        return unless run

        run[...-1]
      end
    end
  end
end
