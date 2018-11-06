Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do
    resources :profiles
  end

  resources :boats do
    resources :reservations
    resources :reviews
    resources :availibilities
  end
 end
