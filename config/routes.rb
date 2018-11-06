Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do
    resources :profile
<<<<<<< HEAD
    resources :boats do
      resources :availibilities, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :boats, only: [:index, :show] do
=======
    resources :boats

  end

  resources :boats, only: [:show] do
>>>>>>> 4b4fe70c060ccf52a65f6cc28e7fbfbf85643415
    resources :reservations, only: [:new, :create]
    resources :reviews
    resources :availibilities, only: [:index, :show]
  end

<<<<<<< HEAD
  resources :profile do
=======
  resources :profiles, only: [:show] do
>>>>>>> 4b4fe70c060ccf52a65f6cc28e7fbfbf85643415
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
  end
 end
