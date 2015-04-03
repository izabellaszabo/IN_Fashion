Rails.application.routes.draw do
  
  get 'contacts/new'

  #ADDED BY NIALL WHAT DOES THIS TO DO
  resources :products, only:[:index]
  resource :cart, only:[:show]
  resources :contacts
  resources :users
  resources :order_items, only: [:create,:update,:destroy]
  #root to:"products#index"
  #ADDED BY NIALL WHAT DOES THIS TO DO
  
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  get 'products/index'

  get 'account' => 'users#account'
  get 'home' => 'site#home'
  get 'about' => 'site#about'
  #get 'contact' => 'site#contact' 
  get 'womens' => 'products#women'
  get 'mens' => 'products#men'
  get 'sport' => 'products#index'
  get 'accessories' => 'products#index'
  get 'item' => 'products#item'
  get 'contact' => 'contacts#new' 
  get 'checkout' => 'cart#checkout'
  get 'cart' => 'cart#show'
  
  #Added for the login action
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'

  #Sets the path for the main page when they go to the website eg index
  #root 'site#home'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'site#home'

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
