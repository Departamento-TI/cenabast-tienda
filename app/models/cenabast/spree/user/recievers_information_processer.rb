# frozen_string_literal: true

# Processes reciever information from the api
# Creates, and updates Cenabast::Spree::Requester, Cenabast::Spree::Reciever
# and Spree::User models if necesary
module Cenabast
  module Spree
    module User
      class RecieversInformationProcesser
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
          Cenabast::Api::ReceiversInformationFetcher
        end

        # Information from API
        def info
          @info ||= service.new(run).call
        end

        # Process the information into records
        def process_information
          return unless info&.dig(:success)

          providers = info[:response_body]&.map(&:deep_symbolize_keys)
          providers.each do |provider|
            process_provider(provider)
          end
        end

        def process_provider(provider)
          Rails.logger.debug { "Processing provider info #{provider}" }

          channel = provider[:nombreCanal]
          return unless allowed_channels.include? channel

          user_run = info[:rut_usuario]
          cenabast_id_relationship = info[:idRelacion]
          requester_run = info[:rutSolicitante]
          requester_name = info[:solicitante]
          reciever_run = info[:rutDestinatario]
          reciever_name = info[:destinatario]
          delivery_address = info[:direccionDespacho]

          requester = Cenabast::Spree::Requester.find_or_create_by!(run: requester_run)
          requester.update!(name: requester_name)

          reciever = Cenabast::Spree::Reciever.find_or_create_by!(run: reciever_run, requester:)
          reciever.update!(
            name: reciever_name,
            address: delivery_address
          )

          user = ::Spree::User.find_by!(run: user_run.to_s)
          Cenabast::Spree::RecieverUser.find_or_create_by(
            reciever:,
            user:,
            cenabast_id_relationship:
          )
        end

        # Only process providers that match allowed channels
        def allowed_channels
          ['INTERMEDIACION', 'ECOMMERCE']
        end
      end
    end
  end
end
