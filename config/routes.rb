Rails.application.routes.draw do
  root to: "pages#home"
  
  devise_for :users
  resources :planets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :destroy]
  resources :users, only: [:show]
  resources :reviews


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
