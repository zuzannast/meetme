Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admins

  root 'home#index'

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
    post '/profile', to: 'user#update'
  end

  resources :events, only: [:new, :create]
  resources :comments
  resources :participants

  resources :followers do
    collection do
      get 'random'
    end
  end

  # React routes
  get '/app', to: 'home#index'
  get '/app/events', to: 'events#index'
  get '/app/events/:id', to: 'events#show'
end
