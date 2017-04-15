Rails.application.routes.draw do
  resources :points, only: :update
  # resources :boards
  # resources :games
  # resources :players
  
  get 'boards/:id/process_gamestate', to: 'boards#process_gamestate'
  get 'players/create', to: 'players#create'
  root "static#show"
end
