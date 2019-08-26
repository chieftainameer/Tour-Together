Rails.application.routes.draw do
  
  resources :comments
  resources :posts
  resources :reviews
  resources :registrations, only: [:create]
  root 'home#index'
  resources :tours do
    member do
      put 'like', to:'tours#upvote'
      put 'unlike', to:'tours#downvote'
    end
  end
  devise_for :users
  resources :joinedtours
  resources :wishlists
  resources :relationships, only: [:create, :destroy]
  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'logout', to: 'devise/sessions#destroy'
  get 'create', to: 'devise/registrations#new'
  resources :users, only: [:index, :show, :edit, :update, :change_name] do
    member do
      get 'following', to: 'users#following'
      get 'followers', to: 'users#followers'

    end
  end
end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
