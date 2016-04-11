Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :admins, only: :index

  root 'home#index'
end
