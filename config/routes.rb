Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :new] do
    collection do
      post :pay
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :purchases, only: :new
end
