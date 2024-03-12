# frozen_string_literal: true

class Products::CardComponent < ApplicationComponent
  # @param product_data hash
  # => @param id number
  # => @param name text
  # => @param description text
  # => @param image text
  # => @param price text
  # => @param vendor_name text
  # => @param url text
  # @param cache_key array

  def initialize(product_data:, cache_key:)
    super
    @product_id = product_data[:id]
    @product_name = product_data[:name]
    @product_description = product_data[:description]
    @product_image = product_data[:image]
    @product_price = product_data[:price]
    @vendor_name = product_data[:vendor_name]
    @product_url = product_data[:url]
    @cache_key = cache_key
  end
end
