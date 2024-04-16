# frozen_string_literal: true

module Cenabast::Spree::Erp
  # Cancels all sale orders of a certain Spree::Order
  class OrderCanceller
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def call
      order.sale_orders.each(&:cancel_in_erp!)
    end
  end
end
