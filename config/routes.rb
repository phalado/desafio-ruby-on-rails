Rails.application.routes.draw do
  root 'transactions#index'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'transactions/new'
  get 'transactions/create'
  get 'transactions/show'
  post 'users/new', to: 'users#create'
  post 'transactions/new', to: 'transactions#create'
  resources :user
end
