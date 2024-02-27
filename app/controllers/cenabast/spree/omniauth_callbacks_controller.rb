class Cenabast::Spree::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_run, only: :clave_unica

  def clave_unica
    if @run && Cenabast::Spree::User::InformationUpdater.new(@run).call

      validator = Cenabast::Spree::User::LoginValidator.new(@run)
      user = validator.call
      if user
        flash[:notice] = Spree.t(:login_success)
        sign_in_and_redirect user, event: :authentication
      else
        flash[:error] = validator.error_messages.first
        redirect_to spree.new_spree_user_session_path
      end
    else
      flash[:error] = Spree.t(:error_contacting_cenabast_services)
      redirect_to spree.new_spree_user_session_path
    end
  end

  def failure
    flash[:error] = Spree.t(:error_contacting_clave_unica_services)
    redirect_to spree.new_spree_user_session_path
  end

  private

  def set_run
    raw_run = request&.env&.dig('omniauth.auth', 'extra', 'raw_info', 'preferred_username')
    @run = Chilean::Rutify.normalize_rut(raw_run)
  rescue StandardError => e
    Rails.logger.error "Exception raised obtaining user run: #{e.message}"
  end
end
