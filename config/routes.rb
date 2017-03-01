Rails.application.routes.draw do
  root to: 'blogs#index'

  concern :pageable do
    get '(page/:page)', action: :index, on: :collection, as: :page
  end

  concern :portionable do
    get '(portions/:portions)', action: :show, on: :member, as: :portions, constraints: { portions: /[0-9]*/ }
  end

  concern :taggable do 
    get '(tag/:tag)', action: :index, on: :collection, as: :tag
  end

  get 'search(/:query)', to: 'search#search', as: :search
  get 'tags(/:query)', to: 'search#tags', as: :search_tags

  concern :commentable do
    resources :comments, shallow: true, only: [:create, :edit, :update, :destroy]
  end


  resources :blogs, concerns: [:pageable, :commentable]
  resources :pages do
    member do
      get ':children' => 'pages#children', as: :children
    end
  end

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy], concerns: [:pageable]

  resources :ingredients, concerns: [:pageable]
  resources :recipes, concerns: [:pageable, :commentable, :portionable, :taggable] do
    collection do
      get ':new' => 'recipes#new', as: :new, constraints: { new: /new/ }
    end
  end

  resources :activities, only: [:index]
  resources :settings
  resources :units
end
