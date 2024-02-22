# frozen_string_literal: true

# Processes receiver information from the api
# Creates, and updates Cenabast::Spree::Requester, Cenabast::Spree::Receiver
# and Spree::User models if necesary
module Cenabast
  module Spree
    module User
      class ReceiversInformationProcesser
        attr_accessor :run, :added_receivers

        # @param run [String] run to query, without DV and dots
        def initialize(run)
          @run = run
          @added_receivers = []
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

          if info[:response_content].instance_of? Array
            info[:response_content].map(&:deep_symbolize_keys).each do |receiver|
              process_receiver(receiver)
            end
          else
            receiver = info[:response_content]&.deep_symbolize_keys
            process_receiver(receiver)
          end

          process_unused_receivers
        end

        def process_receiver(receiver)
          Rails.logger.debug { "Processing receiver info #{receiver}" }

          channel = receiver[:nombreCanal]
          return unless allowed_channels.include? channel

          requester_run = Cenabast::Spree::Requester.raw_run_to_formatted(receiver[:rutSolicitante])
          receiver_run = Cenabast::Spree::Receiver.raw_run_to_formatted(receiver[:rutDestinatario])

          cenabast_id_relationship = receiver[:idRelacion]
          receiver_name = receiver[:destinatario]
          requester_name = receiver[:solicitante]
          delivery_address = receiver[:direccionDespacho]

          requester = Cenabast::Spree::Requester.find_or_initialize_by(run: requester_run)
          requester.update!(name: requester_name)

          receiver = Cenabast::Spree::Receiver.find_or_initialize_by(run: receiver_run, requester:)
          receiver.update!(
            name: receiver_name,
            address: delivery_address
          )

          added_receivers << receiver

          if user
            Cenabast::Spree::ReceiverUser.find_or_create_by(
              receiver:,
              user:,
              cenabast_id_relationship:
            )
          end
        end

        def process_unused_receivers
          return unless user

          # Unlink relationships that werent found
          Cenabast::Spree::ReceiverUser.where(
            user:
          ).where.not(
            receiver_id: added_receivers.map(&:id)
          ).destroy_all
        end

        def user
          @user ||= ::Spree::User.find_by(run: ::Spree::User.raw_run_to_formatted(run))
        end

        # Only process receivers that match allowed channels
        def allowed_channels
          ['INTERMEDIACION', 'ECOMMERCE']
        end
      end
    end
  end
end
