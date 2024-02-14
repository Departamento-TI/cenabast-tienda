# frozen_string_literal: true

require 'omni_auth/strategies/clave_unica'

Rails.application.config.after_initialize do
  if defined?(Spree::Auth)
    Spree::Auth::Config.signout_after_password_change = false
  end
end

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  config.secret_key = Rails.application.secrets.secret_key_base

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  # OmniAuth.config.full_host = ENV['APP_HOST']
  config.omniauth :clave_unica,
      ENV['KEYCLOAK_CLIENT_ID'],
      ENV['KEYCLOAK_CLIENT_SECRET'],
      strategy_class: OmniAuth::Strategies::ClaveUnica
end
