Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :profile
    resources :boats do
      resources :availibilities, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :boats, only: [:index, :show] do
    resources :reservations, only: [:new, :create]
    resources :reviews
    resources :availibilities, only: [:index, :show]
  end

  resources :profile do
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
  end
 end
