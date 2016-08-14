Rails.application.routes.draw do
  resources :followers do
    collection do
      get 'random'
    end
  end

  resources :participants

  devise_for :users
  devise_for :admins

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
    post '/profile', to: 'user#update'
  end

  resources :events
  resources :comments

  root 'home#index'
end
