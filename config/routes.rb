Rails.application.routes.draw do
  root to: "planets#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :planets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update, :index, :destroy]
  resources :users, only: [:show, :update]
  resources :reviews

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
