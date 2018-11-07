Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'

  resources :users, only: [:show] do
    resources :reservations, only: [:index, :edit, :update, :destroy, :show]
  end
  resources :profiles


  resources :boats do
    resources :reviews
    resources :availibilities
    resources :reservations, only: [:create, :new]
  end
 end
