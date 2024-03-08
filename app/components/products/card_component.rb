# frozen_string_literal: true

class Products::CardComponent < ApplicationComponent
  # include Spree::Core::ControllerHelpers::Currency

  def initialize(product:)
    super
    @product = product
    # @index = index
  end
end
