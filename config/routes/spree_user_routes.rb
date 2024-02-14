# Force the reload of Spree::User decorator
# This might be needed in development environments because on hot reloads, the routes
# are reloaded before the decorators and thus the omniauth configuration is not yet defined.
require 'cenabast/spree/user_decorator' 

Spree::Core::Engine.add_routes do
  scope '(:locale)', locale: /#{Spree.available_locales.join('|')}/, defaults: { locale: nil } do
    devise_for :spree_user,
              class_name: Spree.user_class.to_s,
              controllers: { sessions: 'spree/user_sessions',
              omniauth_callbacks: 'cenabast/spree/omniauth_callbacks' },
              skip: [:unlocks],
              path_names: { sign_out: 'logout' },
              path_prefix: :user

    devise_scope :spree_user do
      get '/login' => 'user_sessions#new', :as => :login
      post '/login' => 'user_sessions#create', :as => :create_new_session
      get '/logout' => 'user_sessions#destroy', :as => :logout
    end

    if Spree::Core::Engine.frontend_available?
      resources :users, only: [:edit, :update]
      resource :account, controller: 'users'
    end

    if Spree.respond_to?(:admin_path) && Spree::Core::Engine.backend_available?
      namespace :admin, path: Spree.admin_path do
        devise_for :spree_user,
                  class_name: Spree.user_class.to_s,
                  controllers: { sessions: 'spree/admin/user_sessions' },
                  skip: [:unlocks, :registrations],
                  path_names: { sign_out: 'logout' },
                  path_prefix: :user

        devise_scope :spree_user do
          get '/authorization_failure', to: 'user_sessions#authorization_failure', as: :unauthorized
          get '/login' => 'user_sessions#new', :as => :login
          post '/login' => 'user_sessions#create', :as => :create_new_session
          get '/logout' => 'user_sessions#destroy', :as => :logout
        end
      end
    end
  end
end
