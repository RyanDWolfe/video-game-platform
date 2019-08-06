Rails.application.routes.draw do
  resources :game_sessions
  resources :developers
  resources :games
  resources :sessions
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
