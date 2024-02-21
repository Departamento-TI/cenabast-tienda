# frozen_string_literal: true

# Fetches user information from Cenabast APIs for a particular RUN
# Creates, and updates Spree::User models if necesary
# Bases common behaviour taken from Cenabast::Api::Base
module Cenabast
  module Spree
    module User
      class InformationUpdater
        attr_accessor :run

        # @param run [String] run to query, without DV and dots
        def initialize(run)
          @run = run
        end

        # Calls the API to grab information, filters and inserts them into models
        # If the transaction was successful, it will return a true value.
        def call
          process_information
        end

        private

        # Individual process methods
        def process_buyer_information
          Cenabast::Spree::User::BuyerUserInformationProcesser.new(run).call
        end

        def process_provider_information
          Cenabast::Spree::User::ProviderUserInformationProcesser.new(run).call
        end

        def process_receivers_information
          Cenabast::Spree::User::ReceiversInformationProcesser.new(run).call
        end

        def process_companies_information
          Cenabast::Spree::User::CompaniesInformationProcesser.new(run).call
        end

        # Process information
        def process_information
          # Wrap everything into a DB transaction, so the update is atomic
          ActiveRecord::Base.transaction do
            process_buyer_information
            process_provider_information
            process_receivers_information
            process_companies_information
          end
          # If the transaction is successful,
          # ActiveRecord::Base.transaction doesn't raise an exception.
          # Return success
          true
        rescue StandardError => e
          # If an exception occurs during the transaction, return false for failure
          Rails.logger.error("[#{self.class.name}] Transaction failed: #{e.message}")
          Rails.logger.debug { "[#{self.class.name}] #{e.backtrace.join("\n")}" }
          false
        end
      end
    end
  end
end
