# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  Rails.application.config.lookbook.preview_layout = 'spree/layouts/lookbook_layout'
  Rails.application.config.lookbook.preview_paths = ["#{Rails.root}/spec/components/previews"]
end
