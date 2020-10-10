Rails.application.routes.draw do
  resources :home, only: %i[index]
  resources :games, only: %i[index show]

  root to: "home#index"
end
