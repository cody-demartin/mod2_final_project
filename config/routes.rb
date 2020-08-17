Rails.application.routes.draw do
  resources :questions
  root to: 'pages#home'
  devise_for :users
  
end
