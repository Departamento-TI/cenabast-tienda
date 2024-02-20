# frozen_string_literal: true

# Fetches user information from Cenabast APIs for a particular RUN
# Creates, and updates Spree::User models if necesary
# Bases common behaviour taken from Cenabast::Api::Base
module Cenabast
  module Spree
    module User
      class InformationUpdater
        attr_accessor :run

        def initialize(run)
          @run = run
        end

        def call
          process_information
        end

        private

        # Individual process methods
        def process_buyer_information
          Cenabast::Spree::User::BuyerUserInformationProcesser.new(run).call
        end

        def process_receivers_information
          Cenabast::Spree::User::RecieversInformationProcesser.new(run).call
        end

        def process_provider_information
          # Cenabast::Spree::User::ApiProviderUserInformationProcesser.new(run).call
        end

        def process_companies_information
          # Cenabast::Spree::User::ApiCompaniesInformationProcesser.new(run).call
        end

        # Process information
        def process_information
          # Wrap everything into a DB transaction, so the update is atomic
          ActiveRecord::Base.transaction do
            process_buyer_information
            process_receivers_information
            process_provider_information
            process_companies_information
          end
        end
      end
    end
  end
end
