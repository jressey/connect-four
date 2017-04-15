Rails.application.routes.draw do
  resources :points, only: :update
  # resources :boards
  # resources :games
  # resources :players
  
  get 'boards/:id/computer_move', to: 'boards#computer_move'
  get 'players/create', to: 'players#create'
  root "static#show"
end
