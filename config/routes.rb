Rails.application.routes.draw do
  root 'static_pages#timeline'
  get '/dashboard', to: 'static_pages#dashboard'



  resources :posts, only: %i[ show destroy create ] do
    resources :comments, module: :posts
    resources :likes, module: :posts
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
