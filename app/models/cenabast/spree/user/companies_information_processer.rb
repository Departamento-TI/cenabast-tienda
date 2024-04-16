# frozen_string_literal: true

# Processes companies user information from the api
# Creates, and updates Spree::Vendor model(s) if necessary
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

          company_run = ::Spree::Vendor.raw_run_to_formatted(company[:rutProveedor])
          company_name = company[:nombreProveedor].strip
          company_active = company[:activo]

          vendor = ::Spree::Vendor.find_or_initialize_by(run: company_run)

          if vendor.name != company_name
            vendor.name = company_name
            vendor.save
          end

          company_active ? vendor.activate : vendor.block
          vendor.users << user if user && vendor.users.exclude?(user)

          added_companies << vendor
        end

        def process_unused_companies
          return unless user

          # Unlink relationships that werent found
          ::Spree::VendorUser.where(
            user:
          ).where.not(
            vendor_id: added_companies.map(&:id)
          ).destroy_all
        end

        def user
          @user ||= ::Spree::User.find_by(run: ::Spree::User.raw_run_to_formatted(run))
        end
      end
    end
  end
end
