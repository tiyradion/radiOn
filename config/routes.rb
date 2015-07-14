Rails.application.routes.draw do

  get 'dashboard/home'

  root 'dashboard#home'

  get 'sessions/login'
  post 'sessions/login'

  get 'sessions/logout'

  resources :comments
  resources :stations, except: [:index, :show]
  resources :promoters, except: [:index, :show]
  namespace :api, defaults: {format: 'json'} do
    resources :artists do
      member do
        post :feedbacks
        # get :comments
        # post :comments
      end
    end
    resources :stations, only: [:index, :show, :update] do
      member do
        get :promoters
      end
    end
    resources :promoters, only: [:index, :show, :update] do
      member do
        get :artists
        get :stations
        get :requests
        get :comments
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
