# frozen_string_literal: true

class Order::Checkout::StepComponent < ApplicationComponent
  # @param step_params hash
  # => @param title text
  # => @param active toggle
  # => @param action_url title
  # => @param format select { choices: [small, big] }
  # => @param details array [String]
  def initialize(step_params: {})
    super

    @title = step_params[:title]
    @active = step_params[:active]
    @enabled_link = step_params[:enabled_link]
    @action_url = step_params[:action_url]
    @format = step_params[:format]
    @details = step_params[:details] || []
  end

  private

  def container_styles
    if @active
      <<-STYLE
      item-cart-parent mx-auto p-0 maw-w-full max-h-full bg-white rounded-lg
      border border-l-[16px] mb-[24px] shadow-sm font-medium text-left
      flex flex-col border-primary-600
      STYLE
    else
      <<-STYLE
      item-cart-parent mx-auto p-0 maw-w-full max-h-full bg-white rounded-lg
      border border-l-[16px] mb-[24px] shadow-sm font-medium text-left
      flex flex-col border-gray-200
      STYLE
    end
  end

  def section_header_styles
    if @active
      'm-3 px-2 flex flex-row text-primary-700'
    else
      'm-3 px-2 flex flex-row text-gray-500'
    end
  end

  def information_section_styles
    if @active
      'm-3 px-2 text-gray-700 text-sm flex flex-col'
    else
      'm-3 px-2 text-gray-400 text-sm flex flex-col'
    end
  end
end
