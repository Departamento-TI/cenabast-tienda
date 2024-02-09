# frozen_string_literal: true

class Common::Layout::Header::GrayPickerComponent < ApplicationComponent
  # @param title text
  # @param value text
  # @param selected id
  # @param options array
  # => @param id number
  # => @param title text
  # @param form_path_method text
  def initialize(title:, value:, selected:, options:, form_path_method: '#')
    super
    @title = title
    @value = value
    @selected = selected
    @options = options
    @form_path_method = form_path_method
  end
end
