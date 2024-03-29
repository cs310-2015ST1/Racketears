Rails.application.routes.draw do

  get 'sessions/new'

  root 'welcome#index'

  get 'aboutpage' => 'welcome#about'

  get 'waterfountains' => 'water_fountains#index'

  get 'bikeracks' => 'bike_racks#index'

  post 'bikeracks/populateBRData' => 'bike_racks#populateBRData'

  post 'waterfountains/populateWFData' => 'water_fountains#populateWFData'

  get 'mapracks' => 'bike_racks#map'


  get 'fountainsmap' => 'water_fountains#map'

  get 'bikeracks/heatmap' => 'bike_racks#heatmap'

  get 'waterfountains/heatmap' => 'water_fountains#heatmap'

  get 'signup' => 'users#new'

  get 'users/new'

  get 'login'   => 'sessions#new'

  post 'login'   => 'sessions#create'

  delete 'logout'  => 'sessions#destroy'

  resources :bike_racks
  resources :water_fountains
  resources :users
  resources :favorite_water_fountains, only: [:create, :destroy]
  resources :favorite_bike_racks, only: [:create, :destroy]



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
  #     resources :comments
  #     resources :sales do
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
