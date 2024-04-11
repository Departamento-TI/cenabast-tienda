Rails.application.routes.draw do
  # Spree routes
  mount Spree::Core::Engine, at: '/'

  # Spree User routes
  instance_eval(File.read(Rails.root.join("config/routes/spree_user_routes.rb")))

  # Spree admin routes
  instance_eval(File.read(Rails.root.join("config/routes/spree_admin_routes.rb")))

  # sidekiq web UI
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.secrets.sidekiq_username &&
      password == Rails.application.secrets.sidekiq_password
  end
  mount Sidekiq::Web, at: '/sidekiq'

  get '/checkout/steps/move_substep', to: 'spree/checkout#move_substep', as: :checkout_move_substep

  # User preferences
  post 'user_preferences/toggle_requester/:option_id',
    to: 'cenabast/spree/user_preferences#toggle_requester',
    as: :toggle_requester

  post 'user_preferences/toggle_receiver/:option_id',
    to: 'cenabast/spree/user_preferences#toggle_receiver',
    as: :toggle_receiver

  post 'user_preferences/toggle_store/:option_id',
    to: 'cenabast/spree/user_preferences#toggle_store',
    as: :toggle_store

  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :admin do
    resources :counties
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resources :counties, only: [:index, :show], controller: '/cenabast/spree/api/v2/storefront/counties'
      end

      namespace :platform do
        resources :generic_products, controller: '/cenabast/spree/api/v2/platform/generic_products'
        resources :contracts, controller: '/cenabast/spree/api/v2/platform/contracts'
        resources :vendors, controller: '/cenabast/spree/api/v2/platform/vendors'
        resources :properties, controller: '/cenabast/spree/api/v2/platform/properties'
      end
    end
  end
end

