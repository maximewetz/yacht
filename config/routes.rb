Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: 'boats#index'

  resources :users, only: [:show]
  resources :profiles


  resources :boats do
    resources :reviews
    resources :availibilities do
      resources :reservations
    end
  end
 end
