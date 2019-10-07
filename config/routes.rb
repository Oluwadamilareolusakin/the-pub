Rails.application.routes.draw do
  root 'users#timeline'
  get '/dashboard', to: 'users#show'
  
  resources :posts do
    resources :comments, module: :posts
  end

  resources :users do
    member do
      resources :comments
    end
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
