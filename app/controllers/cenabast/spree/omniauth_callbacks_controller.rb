class Cenabast::Spree::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def clave_unica
    flash[:notice] = Spree.t(:success)
    Rails.logger.debug(request.env['omniauth.auth'])
    # @user = User.from_omniauth(request.env['omniauth.auth'])
    # return unless @user.persisted?
    # sign_in_and_redirect @user, event: :authentication

    redirect_to spree.root_path
  end

  def failure
    redirect_to spree.root_path
  end
end
