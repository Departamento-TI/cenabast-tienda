# frozen_string_literal: true

# Fetches all the related institutions (receiver/destinatarios) for a particular
# buyer user from Cenabast Api
# Bases common behaviour taken from Cenabast::Api::Base
# https://departamento-ti.github.io/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/user-relations
module Cenabast
  module Api
    class ReceiversInformationFetcher < Cenabast::Api::Base
      attr_accessor :run

      # @param run [String] run to query, without DV and dots
      def initialize(run)
        super()
        @run = run
      end

      private

      def url
        base_url + user_path
      end

      def user_path
        "/interoperabilidad/servicios/v1/tienda/destinatarios/#{run}"
      end
    end
  end
end
