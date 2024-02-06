class Common::Layout::Header::GrayPickerComponentPreview < ViewComponent::Preview
  # @param title text
  # @param value text
  def standard(title: 'Example', value: 'Pick a value...')
    render Common::Layout::Header::GrayPickerComponent.new(
      title:,
      value:
    )
  end
end
