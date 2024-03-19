# frozen_string_literal: true

class Order::Cart::ListComponent < ApplicationComponent
  # @param line_items array of hashes
  # => @param id number
  # => @param dom_id number
  # => @param index number
  # => @param price text
  # => @param quantity number
  # => @param total number
  # => @param name text
  # => @param vendor_name text
  # => @param product_url text
  # => @param product_image_url text

  def initialize(line_items:)
    super
    @line_items = line_items
  end

  private

  def before_render
    @login_url = helpers.spree.spree_user_clave_unica_omniauth_authorize_path
  end
end
