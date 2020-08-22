Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  get "/auth/google_oauth2/callbacks" => "sessions#create"
  resources :answers
  resources :questions
  root to: 'pages#home'
  resources :users
  get '/forbidden', to: 'authorizations#forbidden', as: 'forbidden'
  get '/consultants', to: 'pages#consultants', as: 'consultants'
  get '/users/search_by_company', to: 'users#answers', as: 'user_search'
  
end
