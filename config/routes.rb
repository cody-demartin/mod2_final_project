Rails.application.routes.draw do
  resources :answers
  resources :questions
  root to: 'pages#home'
  devise_for :users
  get '/forbidden', to: 'authorizations#forbidden', as: 'forbidden'

  
  
end
