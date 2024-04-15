Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :orders, except: [:show] do
      resources :sale_orders,
        only: [:index, :edit]
    end
  end
end