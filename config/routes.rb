Rails.application.routes.draw do

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  resources :developers

  resources :games do
    resources :game_sessions
  end

  resources :sessions
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
