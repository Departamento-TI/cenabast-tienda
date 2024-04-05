# frozen_string_literal: true

class Order::Cart::SummaryComponent < ApplicationComponent
  # @param total number
  # @param stats_per_vendor array of hashes
  # => @param vendor_name text
  # => @param subtotal number
  def initialize(total:, stats_per_vendor:)
    super
    @total = total
    @stats_per_vendor = stats_per_vendor || []

    # allow to enable/disable form button
    @valid_order_amounts = true
  end

  def disabled_button?
    !@valid_order_amounts
  end

  private

  def before_render
    @checkout_url = helpers.spree.checkout_path
  end

  def limit_cart_amount_utm
    helpers&.current_store&.limit_cart_amount_utm
  end
end
