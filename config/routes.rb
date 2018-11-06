Rails.application.routes.draw do
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
    resources :reservations
    resources :reviews
    resources :availibilities
  end
 end
