Rails.application.routes.draw do
  

  resources :rides, only: [:create]
  resources :attractions
  resources :users
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
