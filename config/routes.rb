Goodbrews::Application.routes.draw do
  root :to => 'pages#dashboard', :constraints => lambda { request.session[:user_id] }
  root :to => 'pages#welcome' 

  controller :pages do
    get 'dashboard'
    get 'about'
    get 'privacy'
    get 'terms'
  end

  # Authentication and account settings.
  get    'account/sign_up'  => 'users#new'
  get    'account/settings' => 'users#edit'
  put    'account'          => 'users#update'
  delete 'account'          => 'users#destroy'

  controller :user_sessions do
    get  'account/sign_in'  => :new,     :as => :sign_in_users
    post 'account/sign_in'  => :create,  :as => :sign_in_users
    post 'account/sign_out' => :destroy, :as => :sign_out_users
  end

  resources :users, :only => [:show, :create] do
    member do
      get 'liked'
      get 'disliked'
      get 'ignored'
      get 'stashed'
      get 'similar'
    end
  end

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
