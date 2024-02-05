# frozen_string_literal: true

class Common::Button::BaseComponent < ApplicationComponent
  # @param button_params hash
  # =>  @param text text
  # =>  @param size select { choices: [sm, md, lg, xl, xxl] }
  # =>  @param hierarchy select { choices: [primary, secondary_color, secondary_gray, tertiary_color, tertiary_gray, link_color, link_gray] }
  # =>  @param destructive toggle
  def initialize(button_params:)
    super
    @text = button_params[:text]
    @hierarchy = button_params[:hierarchy]
    @size = button_params[:size] || 'md'
    @destructive = button_params[:destructive]
  end

  private

  def btn_classes
    classes = []

    classes << base_classes
    classes << size_classes
    classes << hierarchy_classes

    classes.join(' ')
  end

  def base_classes
    'rounded-lg'
  end

  def size_classes
    {
      sm: 'text-sm min-w-[106px] min-h-[36px] py-2 px-3.5',
      md: 'text-sm min-w-[110px] min-h-[40px] py-2.5 px-4',
      lg: 'text-base min-w-[125px] min-h-[44px] py-2.5 px-4',
      xl: 'text-base min-w-[129px] min-h-[48px] py-3 px-5',
      xxl: 'text-lg min-w-[156px] min-h-[60px] py-4 px-7'
    }[@size.to_sym]
  end

  def hierarchy_classes
    return destructive_hierarchy_classes if @destructive

    {
      primary: 'bg-primary-600 text-white hover:bg-primary-700 focus:bg-primary-600
        focus:shadow-focus disabled:bg-primary-200',
      secondary_color: 'bg-primary-50 text-primary-700 hover:bg-primary-100
        focus:bg-primary-50 focus:shadow-focus disabled:bg-primary-25 disabled:text-primary-300',
      secondary_gray: 'border border-gray-300 bg-white text-gray-700
        hover:bg-gray-300 focus:bg-white focus:shadow-focus-gray disabled:border-gray-200
        disabled:text-gray-300',
      tertiary_color: 'bg-white text-primary-700',
      tertiary_gray: 'bg-white text-gray-500',
      link_color: 'text-primary-700',
      link_gray: 'text-gray-500'
    }[@hierarchy.to_sym]
  end

  def destructive_hierarchy_classes
    {
      primary: 'bg-error-600 text-white',
      secondary_color: 'bg-error-50 text-error-700',
      secondary_gray: 'bg-error-300 text-error-700',
      tertiary_color: 'text-error-700',
      tertiary_gray: 'text-error-700',
      link_color: 'text-error-700',
      link_gray: 'text-error-700'
    }[@hierarchy.to_sym]
  end
end
