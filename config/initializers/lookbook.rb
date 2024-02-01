# frozen_string_literal: true

if Rails.env.development?
  Rails.application.config.lookbook.preview_layout = 'spree/layouts/lookbook_layout'
end
