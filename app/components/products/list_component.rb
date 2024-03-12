# frozen_string_literal: true

class Products::ListComponent < ApplicationComponent
  renders_many :products
  renders_one :pagination

  # @params cache_key text
  def initialize(cache_key:)
    super
    @cache_key = cache_key
  end
end
