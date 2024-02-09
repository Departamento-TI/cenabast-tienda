# frozen_string_literal: true

class Common::Layout::HeaderComponent < ApplicationComponent
  # @param user_data hash
  # => @param name text
  # => @param email text
  # => @param image_url text
  # => @param is_logged_in toggle
  # @param header_data hash
  # => @param current_store_name text
  # => @param current_store_id number
  # => @param available_stores array
  def initialize(header_data:, user_data:)
    super
    @header_data = header_data
    @user_data = user_data

    @current_store_name = header_data&.dig(:current_store_name)
    @available_stores = header_data&.dig(:available_stores)
  end
end
