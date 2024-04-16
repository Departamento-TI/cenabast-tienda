module Cenabast
  module Spree
    module Erp
      class CancelSaleOrderInErp < ::Spree::BaseJob
        wait_proc = lambda do |executions|
          intervals = [60, 300, 600, 1800]
          intervals[executions - 1] || 3600
        end
        retry_on Exception, wait: wait_proc, attempts: 10
        queue_as :erp

        def perform(sale_order)
          Cenabast::Spree::Erp::SaleOrders::CancelInErp.new(sale_order).call
        end
      end
    end
  end
end
