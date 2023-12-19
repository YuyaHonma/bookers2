Rails.application.routes.draw do
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :users do
    resources :books  # ネストされたリソースとしてbooksを設定
  end
  resources :books, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end