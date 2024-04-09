module Cenabast
  module Spree
    module Erp
      class Injector
        def send_order(order)
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end

        private

        def process_response(response)
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end
      end
    end
  end
end
