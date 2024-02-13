class Login::LandingPageComponentPreview < ViewComponent::Preview
  def standard
    render Login::LandingPageComponent.new
  end
end
