Rails.application.routes.draw do
  get 'users/new'

  root to: 'maps#index'
  resources :maps, only: [:index]
  
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :users
end
