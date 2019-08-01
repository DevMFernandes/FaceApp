Rails.application.routes.draw do



  devise_for :users

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users, only: [:show, :index]

  resources :posts do
    resources :comments
  end

  get 'allposts', to: 'posts#all'
  get 'friends', to: 'friendships#index'
  
  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy, :update]

end
