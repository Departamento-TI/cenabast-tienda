module Cenabast
  module Spree
    module Erp
      class InjectorFactory
        def self.create_injector
          ByVendorInjector.new
        end
      end
    end
  end
end
