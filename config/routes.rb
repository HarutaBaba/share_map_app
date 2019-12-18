Rails.application.routes.draw do
  get 'addfriend/addfri'

  get 'friendlist/friend'

  get 'sessions/new'

  root to: 'maps#index'
  resources :maps, only: [:index]
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/friend',   to: 'friendlist#friend'
  get    '/addfri',   to: 'addfriend#addfri'
  
  get '/addfri', to: 'addfriend#search'
  post '/addfri', to: 'addfriend#search'
  
  get '/user', to: 'users#search'
  post '/user', to: 'users#search'

  resources :users
end