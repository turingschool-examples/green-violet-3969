Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights, only: [:index]
  resources :airlines, only: [:show]
  
  delete "/flights", to: "flight_passengers#destroy"
end
