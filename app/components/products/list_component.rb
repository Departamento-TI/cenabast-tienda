# frozen_string_literal: true

class Products::ListComponent < ApplicationComponent
  include Spree::ProductsHelper

  renders_many :products
  renders_one :pagination
end
