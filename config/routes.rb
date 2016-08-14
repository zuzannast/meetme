Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :events, only: [:show, :index]
      resources :followers
      resources :comments
      resources :participants

      root 'home#index'
    end
  end

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
    post '/profile', to: 'user#update'
  end

  resources :events, except: [:show, :index]

  resources :followers do
    collection do
      get 'random'
    end
  end

  resources :comments
  resources :participants

  root 'home#index'
end
