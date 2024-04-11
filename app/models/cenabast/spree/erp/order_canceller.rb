# frozen_string_literal: true

module Cenabast::Spree::Erp
  class OrderCanceller
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def call
      order.erp_order_ids.each do |erp_order_id|
        Cenabast::Api::Erp::CancelOrder.new(erp_order_id).call
      end
    end
  end
end
