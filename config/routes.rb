Rails.application.routes.draw do
  get 'addfriend/addfri'

  get 'friendlist/friend'

  get 'sessions/new'

  root to: 'maps#index'
  resources :maps, only: [:index]
  post  '/'  ,  to: 'maps#index'
  resources :maps
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/friend',   to: 'friendlist#friend'
  get    '/addfri',   to: 'addfriend#addfri'
  
  get '/user_search', to: 'users#search'

  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  #フォローとフォローを外すアクション

  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  #フォロー・フォロワーの一覧ページ

  #get 'users/search' => 'users#search'
  resources :users
  resources :chat, only: %i(create show)
  
end