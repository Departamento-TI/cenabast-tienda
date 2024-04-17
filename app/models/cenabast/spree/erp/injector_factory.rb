module Cenabast
  module Spree
    module Erp
      # Factory class for creating different implementations of Injector
      class InjectorFactory
        # Method to create an instance of Injector based on business logic
        def self.create_injector
          # Ensure to split each sale order injection into products
          # The response of the ERP might bring different pedidoVentaSapId per product
          # we need to make sure to be saving everything.
          ByProductInjector.new
        end
      end
    end
  end
end
