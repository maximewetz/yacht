Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :profiles


  resources :boats do
    resources :reviews
    resources :availibilities do
      resources :reservations
      end
    end
  end
 end