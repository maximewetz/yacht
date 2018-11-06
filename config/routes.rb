Rails.application.routes.draw do
  get 'availibilities/index'
  get 'availibilities/new'
  get 'availibilities/create'
  get 'availibilities/show'
  get 'availibilities/edit'
  get 'availibilities/update'
  get 'boats/index'
  get 'boats/new'
  get 'boats/create'
  get 'boats/show'
  get 'boats/edit'
  get 'boats/update'
  get 'boats/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :profile
  end

  resources :boats do
    resources :reservations, only [:new, :create]
    resources :reviews
    resources :availibilities
  end

  resources :profile do
    resources :reservations, only [:index, :edit, :update, :show, :destroy]
  end
 end
