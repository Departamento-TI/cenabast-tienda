module Helpers
  module PlatformApiHelper
    def generate_token_for(user)
      application = Spree::OauthApplication.find_or_create_by(
        name: 'test',
        uid: 'client_test',
        secret: 'client_test_password',
        scopes: 'admin'
      )

      Spree::OauthAccessToken.create!(
        application:,
        resource_owner: user,
        scopes: 'admin'
      )
    end
  end
end
