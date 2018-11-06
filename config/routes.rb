Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :profile
    resources :boats
  end

  resources :boats, only: [:index, :show] do
    resources :reservations, only: [:new, :create]
    resources :reviews
    resources :availibilities
  end

  resources :profile, only: [:index] do
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
  end
 end
