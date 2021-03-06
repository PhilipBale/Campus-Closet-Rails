Rails.application.routes.draw do

  get 'admin/show'

  get 'account/view'

  get 'clothing/new'

  get 'sessions/new'

  get 'login', to: 'login#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root to: 'static_pages#home'
  
  get '/sizing',   to: 'static_pages#sizing'
  get '/contact', to: 'static_pages#contact'
  post '/user_contacts', to: 'static_pages#send_contact' 

  get '/borrow', to: 'borrow#borrow'
  post '/borrow', to: 'borrow#search'
  post '/import', to: 'borrow#import'

  get '/account', to: 'account#view'
  get '/account/rent/:clothing_code', to: 'account#rent', as: :rent_clothing
  get '/account/cancel/:rental_code', to: 'account#cancel', as: :cancel_rental

  get '/admin', to: 'admin#show'
  get '/admin/:subpage' => 'admin#show', as: :admin_subpage
  post '/admin/:subpage' => 'admin#handle'
  get '/print/:rescode' => 'admin#print_res', as: :admin_print_res
  get '/print_dry_clean/:rescode', to: 'admin#print_dry_clean'
  get '/print_all/', to: 'admin#print_all_labels'
  get '/print_clothing_label/:clothing_code' => 'admin#print_clothing_label'
  get '/show_cart/:email' => 'admin#show_cart', as: :admin_show_cart

  resources :users
  resources :clothing
  resources "contact", only: [:contact, :new, :create]


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
