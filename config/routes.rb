Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles do
    resources :boats, only: [:new, :create, :edit, :destroy] do
      resources :availibilities, only: [:edit, :update, :new, :create]
    end
  end



  resources :boats, only: [:index, :show] do
    resources :reviews
    resources :availibilities, only: [:show] do
      resources :reservations
    end
  end
end
