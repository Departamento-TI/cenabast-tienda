# frozen_string_literal: true

# Processes buyer user information from the api
# Creates, and updates Spree::User models if necesary
module Cenabast
  module Spree
    module User
      class BuyerUserInformationProcesser
        attr_accessor :run

        def initialize(run)
          @run = run
        end

        def call
          process_information
        end

        private

        # Services to fetch information from
        def service
          Cenabast::Api::BuyerInformationFetcher
        end

        # Information from API
        def info
          @info ||= service.new(run).call
        end

        # Process the information into records
        def process_information
          return unless info&.dig(:success)

          user_info = info[:response_body].deep_symbolize_keys
          Rails.logger.debug { "Processing user_info #{user_info}" }

          user = ::Spree::User.find_or_create_by(
            run: user_info[:rut_usuario]
          )

          # Get information
          first_name = user_info[:nombres]&.strip&.capitalize
          last_name = [user_info[:apellido_paterno], user_info[:apellido_materno]]&.compact&.join(' ')&.strip&.capitalize
          email = user_info[:email]
          land_phone = user_info[:telefono]
          mobile_phone = user_info[:movil]
          active = user_info[:activo]

          # Update register
          user.update!(
            user_type: :buyer,
            first_name:,
            last_name:,
            email:,
            land_phone:,
            mobile_phone:,
            active:
          )
        end
      end
    end
  end
end
