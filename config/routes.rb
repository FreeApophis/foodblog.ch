Rails.application.routes.draw do

  root to: "blogs#index"

  concern :pageable do
    get '(page/:page)', action: :index, on: :collection, as: :page
  end

  concern :commentable do
    resources :comments, only: [:create]
  end

  get 'search(/:query)', to: 'search#search', as: :search

  resources :blogs, concerns: [:commentable, :pageable]

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy], concerns: [:pageable]

  resources :ingredients, concerns: [:pageable]
  resources :recipes, concerns: [:pageable]
  resources :activities, only: [:index]
  resources :settings
  resources :units
end
