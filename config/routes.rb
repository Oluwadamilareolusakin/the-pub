Rails.application.routes.draw do
  root 'posts#timeline'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
    get '/signup', to: 'users/registrations#new'
    get '/sign_out', to: 'users/sessions#destroy'
  end

  resources :posts, only: %i[ destroy create show] do
    resources :comments, module: :posts
    resources :likes, module: :posts, only: %i[create index destroy]
  end

  get '/posts', to: 'posts#timeline'
  
  resources :friendships, only: %i[create destroy]
  resources :friend_requests, only: %i[create destroy show]
  resources :notifications, only: %i[ create destroy index] do
    collection do
      post :mark_as_read
    end
  end

  resources :search

  
  
  get '/friends', to: 'friendships#index'
  get '/friend_requests', to: 'users#friend_requests'
  get '/notifications', to: 'users#notifications'
  get '/profiles/:id', to: 'users#show', as: 'profile'
  get '/requesteds', to: 'friend_requests#requesteds'
  get "/requesters", to: "friend_requests#requesters"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
