# frozen_string_literal: true

# Processes receiver information from the api
# Creates, and updates Cenabast::Spree::Requester, Cenabast::Spree::Receiver
# and Spree::User models if necesary
module Cenabast
  module Spree
    module User
      class ReceiversInformationProcesser
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
          Cenabast::Api::ReceiversInformationFetcher
        end

        # Information from API
        def info
          @info ||= service.new(run).call
        end

        # Process the information into records
        def process_information
          return unless info&.dig(:success)

          if info[:response_body].instance_of? Array
            info[:response_body].map(&:deep_symbolize_keys).each do |provider|
              process_provider(provider)
            end
          else
            provider = info[:response_body]&.deep_symbolize_keys
            process_provider(provider)
          end
        end

        def process_provider(provider)
          Rails.logger.debug { "Processing provider info #{provider}" }

          channel = provider[:nombreCanal]
          return unless allowed_channels.include? channel

          user_run = ::Spree::User.raw_run_to_formatted(provider[:rut_usuario])
          requester_run = Cenabast::Spree::Requester.raw_run_to_formatted(provider[:rutSolicitante])
          receiver_run = Cenabast::Spree::Receiver.raw_run_to_formatted(provider[:rutDestinatario])

          cenabast_id_relationship = provider[:idRelacion]
          receiver_name = provider[:destinatario]
          requester_name = provider[:solicitante]
          delivery_address = provider[:direccionDespacho]

          requester = Cenabast::Spree::Requester.find_or_create_by!(run: requester_run) do |new_requester|
            new_requester.name = requester_name
          end

          requester.update!(name: requester_name)

          receiver = Cenabast::Spree::Receiver.find_or_create_by!(run: receiver_run, requester:) do |new_receiver|
            new_receiver.name = receiver_name
          end

          receiver.update!(
            name: receiver_name,
            address: delivery_address
          )

          user = ::Spree::User.find_by!(run: user_run)
          Cenabast::Spree::ReceiverUser.find_or_create_by(
            receiver:,
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
