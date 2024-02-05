# frozen_string_literal: true

class Common::Layout::Header::ProfileComponent < ApplicationComponent
  # @param user_data hash
  # => @param title text
  # => @param value text
  # => @param image_url text
  # => @param is_logged_in toggle
  def initialize(user_data:)
    super
    @name = user_data[:name]
    @email = user_data[:email]
    @image_url = user_data[:image_url]
    @is_logged_in = user_data[:is_logged_in]
  end
end
