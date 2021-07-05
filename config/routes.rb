Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  get 'users/index'
  resources :items, only:[:index, :new, :createm, :show]
  resources :owners, only: :index
end
