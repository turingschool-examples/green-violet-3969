Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights do 
    resources :flights, only: [:index]
    resources :passengers, only: [:destroy], controller: 'flight_passengers'
  end
end
