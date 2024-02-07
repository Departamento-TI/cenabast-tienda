class Common::Layout::HeaderComponentPreview < ViewComponent::Preview
  def standard
    render Common::Layout::HeaderComponent.new(
      user_data: {
        name: 'John Doe',
        email: 'example@spree.com',
        image_url: 'test-avatar.jpg',
        is_logged_in: true
      }
    )
  end
end
