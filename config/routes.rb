Rails.application.routes.draw do

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  
  get '/auth/facebook/callback' => 'sessions#create'

  resources :developers

  resources :games do
    resources :game_sessions
  end

  resources :sessions
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
