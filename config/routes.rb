Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/flights", to: "flights#index"
  get "flights/:id", to: "flights#show"
  delete "/flights/:id", to: "flights#destroy"
  
end
