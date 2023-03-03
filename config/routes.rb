Rails.application.routes.draw do
  root to: "planets#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :planets do
    resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
    member do
      
    end
  end
  resources :bookings, only: [:edit, :update, :index, :destroy, :show]
  resources :users, only: [:show, :update]
  get 'bookings/new', to: 'bookings#new', as: 'new_booking'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
