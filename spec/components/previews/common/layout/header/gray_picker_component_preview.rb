class Common::Layout::Header::GrayPickerComponentPreview < ViewComponent::Preview
  # @param title text
  # @param value text
  def standard(title: 'Example', value: 'Pick a value...')
    render Common::Layout::Header::GrayPickerComponent.new(
      title:,
      value:,
      selected: 2,
      options: [
        { id: 1, title: 'Test' },
        { id: 2, title: 'Prueba' },
        { id: 3, title: 'Cenabast' }
      ],
      form_base_path: '#'
    )
  end
end
