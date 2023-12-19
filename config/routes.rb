Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :users do
    resources :books  # ネストされたリソースとしてbooksを設定
  end
  resources :books, only: [:new, :index, :show, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end