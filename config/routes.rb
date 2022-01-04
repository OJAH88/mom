Rails.application.routes.draw do
  resources :items
  resources :recipes
  resources :food_logs
  resources :shopping_lists
  resources :messages
  resources :friendships
  resources :kitchens
  resources :users
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/kitchens", to: "kitchens#show"
  get "/items", to: "items#show"
  get "/itemscount", to: "items#count"
  post "/login", to: "sessions#create"

  post "/login", to: "users#login"
  post "/login", to: "users#token_authenticate"

  delete "/logout", to: "sessions#destroy"

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
