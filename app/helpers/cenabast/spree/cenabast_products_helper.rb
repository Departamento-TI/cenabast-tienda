module Cenabast
  module Spree
    module CenabastProductsHelper
      def mercado_publico_link_for_product(product)
        mercado_publico_id = product&.contract&.mercado_publico_id

        if mercado_publico_id
          result_url = "https://www.mercadopublico.cl/Procurement/Modules/RFB/DetailsAcquisition.aspx?idlicitacion=#{mercado_publico_id}"
          link_to(mercado_publico_id, result_url, { class: 'underline underline-offset-1' })
        else
          '--'
        end
      end
    end
  end
end
