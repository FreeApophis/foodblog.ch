Rails.application.routes.draw do

  root to: "blogs#index"

  concern :pageable do
    get '(page/:page)', action: :index, on: :collection, as: :page
  end

  concern :portionable do
    get '(portions/:portions)', action: :show, on: :member, as: :portions, constraints: { portions: /[0-9]*/ }

  end


  concern :commentable do
    resources :comments, only: [:create]
  end

  get 'search(/:query)', to: 'search#search', as: :search

  resources :blogs, concerns: [:pageable, :commentable]

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy], concerns: [:pageable]

  resources :ingredients, concerns: [:pageable]
  resources :recipes, concerns: [:pageable, :commentable, :portionable] do
    collection do
      get ':new' => 'recipes#new', as: :new, constraints: { new: /new/ }
    end
  end
  resources :activities, only: [:index]
  resources :settings
  resources :units
end
