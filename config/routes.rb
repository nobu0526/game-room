Rails.application.routes.draw do
  
  devise_for :users
  root to: "rooms#index"

  resources :users, only: [:edit, :update, :show]
  resources :users do
    member do
      get :following, :followers, :users_tweets
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
