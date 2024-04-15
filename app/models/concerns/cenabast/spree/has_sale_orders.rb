module Cenabast
  module Spree
    module HasSaleOrders
      extend ActiveSupport::Concern

      included do
        has_many :sale_orders, class_name: 'Cenabast::Spree::Erp::SaleOrder', dependent: :destroy
      end

      def erp_send_status
        # check every rule in order, return status sym
        # if condition is met
        erp_send_status_rules.each do |rule|
          return rule[0] if send(rule[1])
        end

        :unknown
      end

      private

      def erp_send_status_rules
        [
          [:not_prepared, :erp_send_status_not_prepared?],
          [:pending, :erp_send_status_pending?],
          [:with_errors, :erp_send_status_failed?],
          [:partially_nullified, :erp_send_status_partially_nullified?],
          [:nullified, :erp_send_status_nullified?],
          [:cancellation_pending, :erp_send_status_cancellation_pending?],
          [:sent, :erp_send_status_sent?],
        ]
      end

      def erp_send_status_not_prepared?
        sale_orders.none?
      end

      def erp_send_status_pending?
        sale_orders.any?(&:initial?) &&
          sale_orders.none?(&:failed?) &&
          sale_orders.none?(&:nullified?)
      end

      def erp_send_status_failed?
        sale_orders.any?(&:failed?)
      end

      def erp_send_status_partially_nullified?
        sale_orders.any?(&:nullified?) && !sale_orders.all?(&:nullified?)
      end

      def erp_send_status_nullified?
        sale_orders.all?(&:nullified?)
      end

      def erp_send_status_sent?
        sale_orders.all?(&:sent?)
      end

      def erp_send_status_cancellation_pending?
        sale_orders.any?(&:cancellation_pending?)
      end
    end
  end
end
