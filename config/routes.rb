Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/flights', to: 'flights#index', as: 'flights'
  delete 'flights/:id/passengers/:passenger_id', to: 'flights#destroy', as: 'remove_passenger'

  get '/airlines/:id', to: 'airlines#show', as: 'airline'

  resources :flights do
    resources :passengers
  end


end
