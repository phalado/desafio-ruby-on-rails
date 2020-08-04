Rails.application.routes.draw do
  root 'transactions#index'
  get 'transactions/new'
  get 'transactions/create'
  get 'transactions/show'
  post 'transactions/new', to: 'transactions#create'
end
