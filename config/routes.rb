Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  
  resources :books, only: [:index, :show]
  root 'books#index'

  namespace :admin do 
    root 'books#index'   
    resources :books 
    resources :publishers
  end
end
