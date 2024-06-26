# frozen_string_literal: true

class Order::Checkout::Step::AddressFormComponent < ApplicationComponent
  include Spree::AddressesHelper

  # @param order Spree::Order
  def initialize(order:)
    super
    @order = order
  end

  private

  def address
    @address ||= Spree::Address.new(country: helpers.current_store.default_country)
  end

  def default_country
    helpers.current_store.default_country
  end

  def states
    @states ||= address.country.states
  end

  def counties_for_address(address)
    return [] unless (state = address&.state)

    state&.counties
  end
end
