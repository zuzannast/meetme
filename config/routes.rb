Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
    post '/profile', to: 'user#update'
  end

  resources :events, only: [:new, :create]

  # React routes
  get '/app', to: 'home#index'
  scope '/app' do
    resources :events, only: [:show, :index]
    resources :comments
    resources :participants
  
    resources :followers do
      collection do
        get 'random'
      end
    end
  end

  root to: 'application#redirect_to_app'
end
