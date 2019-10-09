Rails.application.routes.draw do
  root 'static_pages#timeline'
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
    delete '/sign_out', to: 'users/sessions#destroy'
  end
  
  get '/dashboard', to: 'static_pages#show'
  
  resources :posts do
    resources :comments, module: :posts
  end

  resources :users do
    member do
      resources :comments
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
