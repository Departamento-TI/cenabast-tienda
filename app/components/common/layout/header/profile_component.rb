# frozen_string_literal: true

class Common::Layout::Header::ProfileComponent < ApplicationComponent
  # @param user_data hash
  # => @param name text
  # => @param email text
  # => @param image_url text
  # => @param is_logged_in toggle
  def initialize(user_data:)
    super
    @name = user_data[:name]
    @email = user_data[:email]
    @image_url = user_data[:image_url]
    @is_logged_in = user_data[:is_logged_in]
  end

  private

  def before_render
    @login_path = helpers.spree.login_path
    @logout_path = helpers.spree.logout_path
    @account_path = helpers.spree.account_path
    @cart_path = helpers.spree.cart_path
  end
end
