# frozen_string_literal: true

class Common::Button::IconComponent < Common::Button::BaseComponent
  # @param button_params hash
  # =>  @param text text
  # =>  @param size select { choices: [sm, md, lg, xl, xxl] }
  # =>  @param hierarchy select { choices: [primary, secondary_color, secondary_gray, tertiary_color, tertiary_gray, link_color, link_gray] }
  # =>  @param destructive toggle
  # @param icon_path text
  # @param icon select { choices: [leading, trailing] }
  def initialize(button_params:, icon_path:, icon:)
    super(button_params:)
    @icon_path = icon_path
    @icon = icon
  end

  private

  # Icon

  def icon_classes
    classes = []

    classes << icon_base_classes
    classes << icon_size_classes
    classes << icon_position_classes

    classes.join(' ')
  end

  def icon_base_classes
    ''
  end

  def icon_size_classes
    {
      sm: 'w-[20px] h-[20px]',
      md: 'w-[20px] h-[20px]',
      lg: 'w-[20px] h-[20px]',
      xl: 'w-[20px] h-[20px]',
      xxl: 'w-[24px] h-[24px]'
    }[@size.to_sym]
  end

  def icon_position_classes
    {
      leading: 'float-left mr-2',
      trailing: 'float-right ml-2'
    }[@icon.to_sym]
  end
end
