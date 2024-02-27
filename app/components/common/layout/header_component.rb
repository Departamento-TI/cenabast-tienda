# frozen_string_literal: true

class Common::Layout::HeaderComponent < ApplicationComponent
  # @param user_data hash
  # => @param name text
  # => @param email text
  # => @param image_url text
  # => @param is_logged_in toggle
  # @param header_data hash
  # => @param current_requester_name text
  # => @param current_requester_id number
  # => @param available_requesters text
  # => @param current_receiver_name text
  # => @param current_receiver_id number
  # => @param available_receivers text
  # => @param current_store_name text
  # => @param current_store_id number
  # => @param available_stores array
  def initialize(header_data:, user_data:)
    super
    @header_data = header_data
    @user_data = user_data

    @current_requester_name = header_data&.dig(:current_requester_name)
    @current_requester_id = header_data&.dig(:current_requester_id)
    @available_requesters = header_data&.dig(:available_requesters)

    @current_receiver_name = header_data&.dig(:current_receiver_name)
    @current_receiver_id = header_data&.dig(:current_receiver_id)
    @available_receivers = header_data&.dig(:available_receivers)

    @current_store_name = header_data&.dig(:current_store_name)
    @current_store_id = header_data&.dig(:current_store_id)
    @available_stores = header_data&.dig(:available_stores)
  end
end
