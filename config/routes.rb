Rails.application.routes.draw do

  get 'friendships/create'
  get 'friendships/destroy'
  devise_for :users

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users, only: [:show, :index]

  resources :posts do
    resources :comments
  end

  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

end
