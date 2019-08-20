Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root 'posts#index'
  get '/about', to: 'static_pages#about'
  resources :users, only: [:show, :index]

  resources :posts do
    resources :comments
  end

  get '/explore', to: 'posts#all'
  get '/friends', to: 'friendships#index'
  get '/requests', to: 'friendships#pending'

  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy, :update]

end
