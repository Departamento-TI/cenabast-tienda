# frozen_string_literal: true

# Fetches the related companies for a particular
# seller user from Cenabast Api
# Bases common behaviour taken from Cenabast::Api::Base
# https://departamento-ti.github.io/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/seller-relations
module Cenabast
  module Api
    class CompaniesInformationFetcher < Cenabast::Api::Base
      attr_accessor :run

      # @param run [String] run to query, without DV and dots
      def initialize(run)
        super()
        @run = run
      end

      private

      def url
        base_url + base_path + user_path
      end

      def user_path
        "/usuario/#{run}/proveedor"
      end
    end
  end
end
