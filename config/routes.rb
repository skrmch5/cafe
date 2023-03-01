Rails.application.routes.draw do
  get 'lectures/index'
  get 'lectures/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'posts/index'
  root 'posts#index'

  resources :posts, only: [:index]
  resources :users, only: [:show]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :reviews, only: [:create]

  end

end
