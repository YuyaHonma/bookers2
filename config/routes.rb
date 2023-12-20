Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:index, :create, :show, :update, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end