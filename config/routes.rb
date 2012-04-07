Goodbrews::Application.routes.draw do
  root :to => 'pages#dashboard', :constraints => lambda { |request| request.session[:user_id] }
  root :to => 'pages#welcome' 

  controller :pages do
    get 'dashboard'
    get 'welcome'
    get 'about'
    get 'privacy'
    get 'terms'
  end

  # Authentication and account settings.
  get    'account/sign_up'             => 'users#new'
  get    'account/settings'            => 'users#edit'
  put    'account'                     => 'users#update'
  delete 'account'                     => 'users#destroy'
  get    'account/password_reset'      => 'password_resets#new',    :as => :new_password_reset
  get    'account/password_resets/:id' => 'password_resets#edit',   :as => :edit_password_reset
  put    'account/password_resets/:id' => 'password_resets#update'
  post   'account/password_resets'     => 'password_resets#create', :as => :password_resets

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
