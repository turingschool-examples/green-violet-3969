Rails.application.routes.draw do
  resources :airlines, only: [:index, :show] do
    resources :flights, only: [:show, :index] do
      resources :passengers, only: [:destroy]
    end
  end
  resources :flights, only: [:index] do
    resources :dashboard, only: [:index]
  end
end
