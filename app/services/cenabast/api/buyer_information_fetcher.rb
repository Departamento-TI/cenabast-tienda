# frozen_string_literal: true

# Fetches establecimiento information (buyer user info)
# for a user RUN from Cenabast Api
# Bases common behaviour taken from Cenabast::Api::Base
# https://departamento-ti.github.io/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/buyer-user-info
module Cenabast
  module Api
    class BuyerInformationFetcher < Cenabast::Api::Base
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
        "/interoperabilidad/servicios/establecimiento/usuario/#{run}"
      end
    end
  end
end
