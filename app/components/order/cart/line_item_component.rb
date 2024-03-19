# frozen_string_literal: true

class Order::Cart::LineItemComponent < ApplicationComponent
  # @param line_item hash
  # => @param id number
  # => @param price text
  # => @param quantity number
  # => @param total number
  # => @param name text
  # => @param vendor_name text
  # => @param product_url text
  # => @param product_image_url text

  def initialize(line_item:)
    super
    @line_item = line_item
    @id = line_item[:id]
    @price = line_item[:price]
    @quantity = line_item[:quantity]
    @total = line_item[:total]
    @name = line_item[:name]
    @vendor_name = line_item[:vendor_name] || 'Hello'
    @product_url = line_item[:product_url]
    @product_image_url = line_item[:product_image_url]
  end
end
