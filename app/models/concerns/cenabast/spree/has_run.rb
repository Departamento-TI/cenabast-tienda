# Concern for adding RUN related logic to a model
# This assumes the model has a field called run to store the run data.
# Based on https://github.com/mihailpozarski/chilean-rutify
module Cenabast
  module Spree
    module HasRun
      extend ActiveSupport::Concern

      included do
        validates :run, uniqueness: { case_sensitive: false }, presence: true, rut: true

        def self.raw_run_to_formatted(value)
          Chilean::Rutify.normalize_rut(value.to_s + Chilean::Rutify.get_verifier(value))
        rescue StandardError => e
          Rails.logger.error "Exception raised formatting run: #{e.message}"
          nil
        end
      end

      def rut=(value)
        value = self.class.raw_run_to_formatted(value)

        super(value)
      end
    end
  end
end
