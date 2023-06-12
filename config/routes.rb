Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights, only: [:index]

  delete "passenger_flights", to: "passenger_flights#destroy"
  
  resources :airlines, only: [:show]
end
