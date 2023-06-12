Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/flights", to: "flights#index"

  get "/airlines/:id", to: "airlines#show"

  delete "/flights/:flight_id/bookings", to: "bookings#destroy"
end
