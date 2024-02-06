class Common::Layout::Header::ProfileComponentPreview < ViewComponent::Preview
  # @param name text
  # @param email text
  # @param image_url text
  # @param is_logged_in toggle
  def standard(name: 'John Doe', email: 'example@spree.com', image_url: 'test-avatar.jpg', is_logged_in: true)
    render Common::Layout::Header::ProfileComponent.new(
      user_data: {
        name:,
        email:,
        image_url:,
        is_logged_in:
      }
    )
  end
end
