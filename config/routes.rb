Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do
    resources :profile
    resources :boats

  end

    resources :boats, only: [:index, :show] do
    resources :reservations, only: [:new, :create]
    resources :reviews
    resources :availibilities
  end



  resources :profiles, only: [:show] do
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
  end
 end
