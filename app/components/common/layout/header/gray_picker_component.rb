# frozen_string_literal: true

class Common::Layout::Header::GrayPickerComponent < ApplicationComponent
  # @param title text
  # @param value text
  def initialize(title:, value:)
    super
    @title = title
    @value = value
  end
end
