Rails.application.routes.draw do
  get 'users/new'

  root to: 'maps#index'
  resources :maps, only: [:index]
end
