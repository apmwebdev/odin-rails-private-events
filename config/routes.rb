Rails.application.routes.draw do
  resources :users, only: [:index]
  get "/profile", to: "users#profile"
  devise_for :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
