Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items
  resources :owners, only:[:index]
  resources :users, only:[:index]
end
