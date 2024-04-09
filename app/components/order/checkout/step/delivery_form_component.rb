# frozen_string_literal: true

class Order::Checkout::Step::DeliveryFormComponent < ApplicationComponent
  include Spree::AddressesHelper

  # @param order Spree::Order
  def initialize(order:)
    super
    @order = order
  end

  private

  def current_receiver
    helpers.spree_current_user&.current_receiver
  end

  def delivery_port_address
    @order&.receiver&.address || @order&.bill_address&.address1
  end
end
