Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admins

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
    post '/profile', to: 'user#update'
    resources :profiles, except: [:index]
  end

  resources :events, only: [:new, :create]
  resources :theaters, only: [:index, :show]

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

  get '/events_list', to: 'events#full_list'
  root to: 'application#redirect_to_app'
end
