Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'logout', to: 'users#logout'
  resources :users, only: [:show]
  resources :credit_cards, only: :new
  resources :items, only: [:index, :show, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :purchases, only: :new
end
