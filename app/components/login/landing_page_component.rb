# frozen_string_literal: true

class Login::LandingPageComponent < ApplicationComponent
  private

  def before_render
    @login_url = helpers.spree_user_clave_unica_omniauth_authorize_path
  end
end
