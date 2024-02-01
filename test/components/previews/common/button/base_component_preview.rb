class Common::Button::BaseComponentPreview < ViewComponent::Preview
  # @param text text
  # @param size select { choices: [sm, md, lg, xl, 2xl] }
  # @param hierarchy select { choices: [primary, secondary-color, secondary-gray, tertiary-color, tertiary-gray, link-color, link-gray] }
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
