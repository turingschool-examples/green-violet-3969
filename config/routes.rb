Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights, only: [:index]
  resources :airlines, only: [:show]

  # resources :flight_passengers, only: [:destroy]
  delete "/flights/:flight_id/passengers/:passenger_id", to: "flight_passengers#destroy"
end
