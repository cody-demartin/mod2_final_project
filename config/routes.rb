Rails.application.routes.draw do
  resources :answers
  resources :questions
  root to: 'pages#home'
  devise_for :users
  
end
