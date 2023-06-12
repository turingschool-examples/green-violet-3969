Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :airlines, only: [:show]
  resources :flights, only: [:index] do 
    resources :flight_passengers, only: [:destroy]
  end
  
    # resources :items, except: [:destroy]
    # resources :item_status, only: [:update]
    # resources :invoices, only: [:index, :show, :update]
    # resources :coupons, except: [:destroy]
  

end
