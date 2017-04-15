Rails.application.routes.draw do
  # resources :points
  # resources :boards
  # resources :games
  # resources :players
  
  get 'players/create', to: 'players#create'
  root "static#show"
end
