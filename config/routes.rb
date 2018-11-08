Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do
    resource :profile
    resources :reservations, only: [:index, :edit, :update, :destroy, :show]
  end
  resources :profiles


  resources :boats do
    resources :reviews
    resources :availibilities
    resources :reservations, only: [:create, :new]
  end
 end
