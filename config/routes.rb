Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  resource :cart, only: [:show, :destroy] do 
    collection do 
      post :add, path: ':id/add'
      get :checkout  # cart#checkout
      # /cart/:id/add
      # POST :add, path: '/add/:id'
      # /cart/add/:id
    end 
  end

  resources :orders, only: [:index, :show, :create] do 
    member do 
      put :cancel  # PUT /orders/2/cancel 
    end 
  end 
  
  resources :books, only: [:index, :show] do 
    member do
      post :comment # POST /books/:id/comment, to: 'books#comment'  
    end 
  end

  resources :publishers, only: [:show]
  resources :categories, only: [:show]

  root 'books#index'

  namespace :admin do 
    root 'books#index'   
    resources :books 
    resources :publishers
    resources :categories
  end

  namespace :api do 
    resources :books, only:[] do 
      member do 
        post :favorite  # api/books/:id/favorite/
      end
    end 
  end
end
