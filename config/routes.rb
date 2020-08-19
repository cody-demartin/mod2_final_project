Rails.application.routes.draw do
  root to: 'pages#home'
  resources :answers
  resources :questions
  devise_for :users
  get '/forbidden', to: 'authorizations#forbidden', as: 'forbidden'
  resources :users, only: [:index, :show, :edit, :update]
  get '/admin', to: 'users#admin', as: 'admin'
  
  
end
