Rails.application.routes.draw do
  resources :points, only: :update
  # resources :boards
  resources :games, only: [:new, :update, :create]
  # resources :players
  
  post 'boards/:id/process_gamestate', to: 'boards#process_gamestate', as: :process_gamestate
  get 'players/create', to: 'players#create'
  root "static#show"
end
