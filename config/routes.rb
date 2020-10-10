Rails.application.routes.draw do
  resources :genres, only: %i[index show]
  resources :platforms, only: %i[index show]
  resources :home, only: %i[index]
  resources :games, only: %i[index show]

  root to: "home#index"
end
