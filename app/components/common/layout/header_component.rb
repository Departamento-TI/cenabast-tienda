# frozen_string_literal: true

class Common::Layout::HeaderComponent < ApplicationComponent
  def initialize(user_data:)
    super
    @user_data = user_data
  end
end
