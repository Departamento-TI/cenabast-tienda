class Common::Button::BaseComponentPreview < ViewComponent::Preview
  # @param text text
  # @param size select { choices: [sm, md, lg, xl, xxl] }
  # @param hierarchy select { choices: [primary, secondary_color, secondary_gray, tertiary_color, tertiary_gray, link_color, link_gray] }
  # @param destructive toggle
  # @param additional_styles text
  def standard(text: 'Click me', size: 'md', hierarchy: 'primary', destructive: false, additional_styles: '')
    button_params = {
      text:,
      size:,
      hierarchy:,
      destructive:,
      additional_styles:
    }

    render Common::Button::BaseComponent.new(button_params:)
  end
end
