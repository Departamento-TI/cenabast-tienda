Rails.application.routes.draw do
  # Spree routes
  mount Spree::Core::Engine, at: '/'

  # Spree User routes
  instance_eval(File.read(Rails.root.join("config/routes/spree_user_routes.rb")))

  # sidekiq web UI
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.secrets.sidekiq_username &&
      password == Rails.application.secrets.sidekiq_password
  end
  mount Sidekiq::Web, at: '/sidekiq'

  # User preferences
  post 'user_preferences/toggle_store/:option_id',
    to: 'cenabast/spree/user_preferences#toggle_store',
    as: :toggle_store

  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
