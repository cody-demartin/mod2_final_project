Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :answers
  resources :questions
  root to: 'pages#home'
  devise_for :users
  get '/forbidden', to: 'authorizations#forbidden', as: 'forbidden'
  resources :users, only: [:show]

  
  
end
