Rails.application.routes.draw do

  root 'transactions#index'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'sessions/new', to: 'sessions#create'

  get 'transactions/new'
  get 'transactions/create'
  get 'transactions/show'
  post 'transactions/new', to: 'transactions#create'

  post 'users/new', to: 'users#create'
  resources :users
end
