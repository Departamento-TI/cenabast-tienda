# frozen_string_literal: true

# Processes companies user information from the api
# Creates, and updates Cenabast::Spree::Company model(s) if necessary
module Cenabast
  module Spree
    module User
      class CompaniesInformationProcesser
        attr_accessor :run, :added_companies

        # @param run [String] run to query, without DV and dots
        def initialize(run)
          @run = run
          @added_companies = []
        end

        def call
          process_information
        end

        private

        # Services to fetch information from
        def service
          Cenabast::Api::CompaniesInformationFetcher
        end

        # Information from API
        def info
          @info ||= service.new(run).call
        end

        # Process the information into records
        def process_information
          return unless info&.dig(:success)

          if info[:response_content].instance_of? Array
            info[:response_content].map(&:deep_symbolize_keys).each do |company|
              process_company(company)
            end
          else
            company = info[:response_content]&.deep_symbolize_keys
            process_company(company)
          end

          process_unused_companies
        end

        def process_company(company)
          Rails.logger.debug { "Processing company info #{company}" }

          company_run = Cenabast::Spree::Company.raw_run_to_formatted(company[:rutProveedor])

          company_name = company[:nombreProveedor]
          active = company[:activo]

          company = Cenabast::Spree::Company.find_or_initialize_by(run: company_run)
          company.update!(
            name: company_name,
            active:
          )

          added_companies << company

          if user
            Cenabast::Spree::CompanyUser.find_or_create_by(
              company:,
              user:
            )
          end
        end

        def process_unused_companies
          return unless user

          # Unlink relationships that werent found
          Cenabast::Spree::CompanyUser.where(
            user:
          ).where.not(
            company_id: added_companies.map(&:id)
          ).destroy_all
        end

        def user
          @user ||= ::Spree::User.find_by(run: ::Spree::User.raw_run_to_formatted(run))
        end
      end
    end
  end
end
