# frozen_string_literal: true

class Order::Checkout::HeaderComponent < ApplicationComponent
  # @param subtotal text
  # @param total text
  def initialize(subtotal:, total:)
    super

    @subtotal = subtotal
    @total = total
  end
end
