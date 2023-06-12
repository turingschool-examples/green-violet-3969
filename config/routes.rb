Rails.application.routes.draw do
  
  resources :flights, except: [:destroy] do
    # get "/flights", to: "flights#index" do

  end
end

