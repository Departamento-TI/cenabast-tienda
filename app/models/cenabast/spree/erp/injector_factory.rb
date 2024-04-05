module Cenabast
  module Spree
    module Erp
      # Factory class for creating different implementations of Injector
      class InjectorFactory
        # Method to create an instance of Injector based on business logic
        def self.create_injector
          ByVendorInjector.new
        end
      end
    end
  end
end
