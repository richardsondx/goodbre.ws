Goodbrews::Application.routes.draw do
  root :to => 'users_sessions#new' 

  resources :users, :only => [:show, :create] do
    member do
      get 'liked'
      get 'disliked'
      get 'ignored'
      get 'stashed'
      get 'similar'
    end

    collection do
      get 'sign_up' => :new
    end
  end

  # Authentication.
  controller :user_sessions do
    get  'users/sign_in'  => :new
    post 'users/sign_in'  => :create
    post 'users/sign_out' => :destroy
  end

  # Account settings for users.
  get    'account/edit' => 'users#edit'
  put    'account'      => 'users#update'
  delete 'account'      => 'users#destroy'

  resources :breweries, :only => :show do
    get 'beers', :on => :member
  end

  resources :beers, :only => :show do
    member do
      post   'like'
      delete 'like'    => :unlike
      post   'dislike'
      delete 'dislike' => :undislike
      post   'ignore'
      delete 'ignore'  => :unignore
      post   'stash'
      delete 'stash'   => :unstash
    end
  end

  resources :styles, :only => [:index, :show] do
    member do
      get 'beers'
    end
  end
end
