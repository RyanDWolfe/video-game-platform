Rails.application.routes.draw do

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get "/players/most_game_sessions", to: 'players#most_game_sessions'

  resources :developers
  # potentially create new route for AJAX response for developers/create and show
  # get '/developer/:id/name', to: 'developers#name'

  resources :games do
    resources :game_sessions
  end

  resources :sessions
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
