# frozen_string_literal: true

class Order::Checkout::Step::DeliveryFormComponent < ApplicationComponent
  include Spree::AddressesHelper

  # @param form FormObject
  def initialize(form:)
    super
    @form = form
    @order = form.object
  end

  private

  def current_receiver
    helpers.spree_current_user&.current_receiver
  end

  def delivery_port_address
    current_receiver&.address || @order&.bill_address&.address1
  end
end
