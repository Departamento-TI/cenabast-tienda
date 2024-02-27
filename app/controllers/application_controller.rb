class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :autorize_cenabast_user!, unless: :devise_controller?

  private

  def autorize_cenabast_user!
    return true if spree_user_signed_in?

    redirect_to new_spree_user_session_path
  end
end
