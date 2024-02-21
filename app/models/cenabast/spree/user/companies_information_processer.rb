# frozen_string_literal: true

# Processes companies user information from the api
# Creates, and updates Cenabast::Spree::Company model(s) if necessary
module Cenabast
  module Spree
    module User
      class CompaniesInformationProcesser
        attr_accessor :run

        # @param run [String] run to query, without DV and dots
        def initialize(run)
          @run = run
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

          if info[:response_body].instance_of? Array
            info[:response_body].map(&:deep_symbolize_keys).each do |company|
              process_company(company)
            end
          else
            company = info[:response_body]&.deep_symbolize_keys
            process_company(company)
          end
        end

        def process_company(company)
          Rails.logger.debug { "Processing company info #{company}" }

          user_run = ::Spree::User.raw_run_to_formatted(company[:rut_usuario])
          company_run = Cenabast::Spree::Company.raw_run_to_formatted(company[:rut_proveedor])

          company_name = company[:nombre_proveedor]
          active = company[:activo]

          company = Cenabast::Spree::Company.find_or_initialize_by(run: company_run)
          company.update!(
            name: company_name,
            active:
          )

          user = ::Spree::User.find_by!(run: user_run)
          Cenabast::Spree::CompanyUser.find_or_create_by(
            company:,
            user:
          )
        end
      end
    end
  end
end
