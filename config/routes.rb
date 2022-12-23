Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
   

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  #---------------------------------Product and Product index--------------------------------------------------------
       get "/landing_page", to: "products#index" , as: :index 
       get "/product/product_index", to: "products#product_index", as: :product_index
       post "/products/all_product", to: "products#product_details"
       get "/products/featured_product",to: "products#featured_product"
       get "/products/single_product/:product_unique_id", to: "products#single_product", as: :single_product

       get "/products/new_product", to: "products#new_product",as: :new_product
       post "/products/create_product", to: "products#create_product",as: :create_product

       get "/products/edit_product/:product_unique_id", to: "products#edit_product",as: :edit_product

       put  "/products/update_product", to: "products#update_product",as: :update_product
       
       get "/products/delete_product/:product_unique_id", to: "products#delete_product",as: :delete_product

       
   
  #--------------------------------------User--------------------------------------------------------
     get "/users/get_user", to: "users#user_index", as: :user_index
     get "/users/new_user", to:  "users#new_user", as: :new_user
     get "/users/edit_user/:unique_id", to:  "users#edit_user", as: :edit_user

     put "/users/update_user/:unique_id", to:  "users#update_user",as: :update_user

     post "/users/create_user", to:  "users#create_user",as: :create_user
     delete "/users/delete_user", to:  "user#delete_user"

     get "/get_states/:country", to: "users#get_states_by_country",as: :get_states
  
     get "/get_cities/:state", to: "users#get_cities_by_state", as: :get_cities
  
  #---------------------------------------cart----------------------------------------------------------
      get "/carts/add_to_wishlist", to: "carts#add_to_wishlist",as: :wishlist


   
     post "/carts/cart_details/", to: "carts#cart_details"
     get "/carts/cart_index/", to: "carts#cart_index", as: :cart_index
     get "/carts/create_cart/:product_unique_id", to:  "carts#create_cart"

     
     get "carts/new_cart", to:  "carts#new_cart"
     get "carts/edit_cart", to:  "carts#edit_cart"
     put "carts/update_cart", to:  "carts#update_cart"
     
     delete "carts/delete_cart", to:  "carts#delete_cart"

     # resources :carts, only: [:new_pay, :create_pay]
     get "carts/new_pay", to: "carts#new_pay", as: :new_pay
     get "carts/create_pay", to: "carts#create_pay"
  #---------------------------------------Payment----------------------------------------------------------
   get "/payments/get_payment", to: "payments#payment_index", as: :payment_index
   

   #--------------------------------------Contact-----------------------------------------------------------
   get "/products/contact", to: "products#contact_us", as: :contact_us 
end
