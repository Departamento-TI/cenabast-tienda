class Cenabast::Spree::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def keycloakopenid
    Rails.logger.debug(request.env['omniauth.auth'])
    @user = User.from_omniauth(request.env['omniauth.auth'])

    return unless @user.persisted?

    sign_in_and_redirect @user, event: :authentication
  end

  def failure
    redirect_to spree.root_path
  end
end
