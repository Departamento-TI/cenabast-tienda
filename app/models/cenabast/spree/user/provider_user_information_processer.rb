# frozen_string_literal: true

# Processes provider user information from the api
# Creates, and updates Spree::User models if necessary
module Cenabast
  module Spree
    module User
      class ProviderUserInformationProcesser
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
          Cenabast::Api::ProviderInformationFetcher
        end

        # Information from API
        def info
          @info ||= service.new(run).call
        end

        # Process the information into records
        def process_information
          return unless info&.dig(:success)

          user_info = info[:response_content].deep_symbolize_keys
          Rails.logger.debug { "[#{self.class.name}] Processing user_info #{user_info}" }

          run = ::Spree::User.raw_run_to_formatted(user_info[:rutUsuario])

          user = ::Spree::User.find_or_initialize_by(run:)

          # Get information
          first_name = user_info[:nombres]&.strip&.capitalize
          last_name = [user_info[:apellidoPaterno], user_info[:apellidoMaterno]]&.compact&.join(' ')&.strip&.capitalize
          email = user_info[:email]
          land_phone = user_info[:telefono]
          mobile_phone = user_info[:movil]

          # Update register
          user.update!(
            user_type: :provider,
            first_name:,
            last_name:,
            email:,
            land_phone:,
            mobile_phone:
          )

          update_buyer_user_role!(user, user_info[:activo])
        end

        def update_provider_user_role!(user, active)
          # Give Provider role
          # or remove Provider role
          role = ::Spree::Role.find_or_create_by!(name: 'provider')
          if active
            ::Spree::RoleUser.find_or_create_by!(role:, user:)
          else
            ::Spree::RoleUser.where(role:, user:).destroy_all
          end
        end
      end
    end
  end
end
