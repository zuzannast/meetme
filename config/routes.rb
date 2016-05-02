Rails.application.routes.draw do
  get 'react_examples/component', to: 'react_examples#component', as: :component
  devise_for :users
  devise_for :admins

  resources :admins, only: :index
  resources :users do
    get '/profile', to: 'users#show'
  end
  
  resources :events

  root 'home#index'
end
