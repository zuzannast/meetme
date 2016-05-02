Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
  end

  root 'home#index'
end
