class Common::Button::IconComponentPreview < ViewComponent::Preview
  # rubocop:disable Metrics/ParameterLists
  # @param text text
  # @param size select { choices: [sm, md, lg, xl, xxl] }
  # @param hierarchy select { choices: [primary, secondary_color, secondary_gray, tertiary_color, tertiary_gray, link_color, link_gray] }
  # @param destructive toggle
  # @param icon_path text
  # @param icon select { choices: [leading, trailing] }
  def standard(text: 'Click me', size: 'md', hierarchy: 'primary', destructive: false, icon_path: 'cart', icon: 'leading')
    button_params = {
      text:,
      size:,
      hierarchy:,
      destructive:
    }

    render Common::Button::IconComponent.new(
      button_params:,
      icon_path:,
      icon:
    )
  end
  # rubocop:enable Metrics/ParameterLists
end
