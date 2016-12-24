Rails.application.routes.draw do

  root to: "blogs#index"

  concern :commentable do
    resources :comments, only: [:create]
  end

  get 'search(/:query)', to: 'search#search', as: :search

  resources :blogs, concerns: [:commentable]

  devise_for :users
  resources :users, only: [:index, :show]

  resources :ingredients
  resources :recipes
  resources :images
  resources :activities, only: [:index]
  resources :settings
  resources :units
end
