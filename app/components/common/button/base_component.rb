# frozen_string_literal: true

class Common::Button::BaseComponent < ViewComponent::Base
  # @param text text
  # @param size select { choices: [sm, md, lg, xl, xxl] }
  # @param hierarchy select { choices: [primary, secondary-color, secondary-gray, tertiary-color, tertiary-gray, link-color, link-gray] }
  # @param destructive toggle
  # @param icon select { choices: [false, leading, trailing, dot, only] }
  def initialize(text:, hierarchy:, icon:, size: 'md', destructive: false)
    super
    @text = text
    @hierarchy = hierarchy
    @icon = icon
    @size = size
    @destructive = destructive
  end

  private

  def btn_classes
    classes = ''

    classes += size_classes

    classes << ' btn-destructive' if @destructive

    classes
  end

  def size_classes
    {
      sm: '',
      md: '',
      lg: 'w-[125px] h-[44px] md:w-2',
      xl: '',
      xxl: ''
    }[@size.to_sym]
  end
end
