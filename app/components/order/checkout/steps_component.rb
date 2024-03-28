# frozen_string_literal: true

class Order::Checkout::StepsComponent < ApplicationComponent
  # @param state text
  # @param address_substep select { choices: [0, 1] }
  def initialize(state:, address_substep:)
    super
    @state = state
    @address_substep = address_substep.to_i
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
      return 1 if @address_substep.zero?

      2
    when 'delivery'
      3
    when 'payment'
      4
    else
      # Something went wrong??
      1
    end
  end
end
