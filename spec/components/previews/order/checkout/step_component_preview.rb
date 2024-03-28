# frozen_string_literal: true

class Order::Checkout::StepComponentPreview < ViewComponent::Preview
  # @param title text
  # @param active toggle
  # @param enabled_link toggle
  # @param action_url text
  # @param format select { choices: [small, big] }
  def default(title: '1. Solicitante', active: true, enabled_link: true, action_url: '#', format: 'big')
    render Order::Checkout::StepComponent.new(
      step_params: {
        title:,
        active:,
        enabled_link:,
        action_url:,
        format:,
        details: [
          'SS Met Sur Oriente',
          'RUT 61.608.500 - K',
          'Centro de Costo : Depto. Finanzas.'
        ]
      }
    )
  end
end
