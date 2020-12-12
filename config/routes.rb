Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
end