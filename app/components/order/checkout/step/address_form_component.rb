# frozen_string_literal: true

class Order::Checkout::Step::AddressFormComponent < ApplicationComponent
  # @param form FormObject
  def initialize(form:)
    super
    @form = form
    @order = form.object
  end
end
