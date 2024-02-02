class Common::Button::BaseComponentPreview < ViewComponent::Preview
  # @param text text
  # @param size select { choices: [sm, md, lg, xl, xxl] }
  # @param hierarchy select { choices: [primary, secondary_color, secondary_gray, tertiary_color, tertiary_gray, link_color, link_gray] }
  # @param destructive toggle
  # @param icon select { choices: [false, leading, trailing, dot, only] }
  def standard(text: 'Click me', size: 'md', hierarchy: 'primary', destructive: false, icon: 'false')
    render Common::Button::BaseComponent.new(
      text:,
      size:,
      hierarchy:,
      destructive:,
      icon:
    )
  end
end
