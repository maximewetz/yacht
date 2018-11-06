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

<<<<<<< HEAD
  resources :boats, only: [:show] do
>>>>>>> 4b4fe70c060ccf52a65f6cc28e7fbfbf85643415
=======
    resources :boats, only: [:index, :show] do
>>>>>>> 1a7df7179d90560357bcc5dc8c01cc38fd6c1b37
    resources :reservations, only: [:new, :create]
    resources :reviews
    resources :availibilities, only: [:index, :show]
  end

<<<<<<< HEAD
<<<<<<< HEAD
  resources :profile do
=======
  resources :profiles, only: [:show] do
>>>>>>> 4b4fe70c060ccf52a65f6cc28e7fbfbf85643415
=======


  resources :profiles, only: [:show] do
>>>>>>> 1a7df7179d90560357bcc5dc8c01cc38fd6c1b37
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
  end
 end
