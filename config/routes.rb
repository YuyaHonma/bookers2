Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit, :update]
  resources :users do
    resources :books  # ネストされたリソースとしてbooksを設定
  end
end