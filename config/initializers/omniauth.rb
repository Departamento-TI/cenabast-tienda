# frozen_string_literal: true

# Define the Keycloak Omniauth Strategy Middleware
# OmniAuth::Strategies::Keycloak
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, ENV['KEYCLOAK_CLIENT_ID'], ENV['KEYCLOAK_CLIENT_SECRET'],
    client_options: { base_url: '', site: ENV['KEYCLOAK_SITE_URL'], realm: ENV['KEYCLOAK_REALM'] },
    name: 'keycloak'
end
