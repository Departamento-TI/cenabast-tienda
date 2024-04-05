# frozen_string_literal: true

class Order::Checkout::StepsComponent < ApplicationComponent
  # @param state text
  # @param order_substep select { choices: [0, 1] }
  # @param bill_address_data hash
  # => @param address text
  # => @param run text
  # @param ship_address_data hash
  # => @param address text
  # => @param run text
  def initialize(state:, order_substep:, bill_address_data:, ship_address_data:)
    super
    @state = state
    @order_substep = order_substep.to_i
    @bill_address_data = bill_address_data
    @ship_address_data = ship_address_data
  end

  private

  def current?(segment_number)
    current_segment == segment_number
  end

  def active_link?(segment_number)
    segment_number <= current_segment
  end

  def current_segment
    case @state
    when 'address'
      return 1 if @order_substep.zero?

      2
    when 'delivery'
      return 3 if @order_substep.zero?

      4
    else
      # Something went wrong??
      1
    end
  end
end
