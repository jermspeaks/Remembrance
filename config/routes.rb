Rails.application.routes.draw do
  resources :sessions, only: [:index, :new, :create, :destroy]
  match 'login', to: 'sessions#new', via: [:get, :post]

    match '/posts/:id/report' => 'review#report',
    :action => :report, :via => :put

    match '/photos/:photo_id/report' => 'review#reportphoto',
    :action => :report, :via => :put



  scope :memorials, :controller => 'memorials' do
    get :attended, :created
  end

  resources :memorials, only: [:index, :show] do
    resources :posts, except: [:index, :show] do
      resources :comments, except: [:index, :show]
    end
    resources :photos, except: [:index, :show, :edit, :update] do
      resources :comments, except: [:index, :show]
    end
  end

  scope :info, :controller => 'info' do
    get :about, :contact, :team
  end

  resources :users, only: [:new, :create, :destroy]
  resources :facebook, only: [:create]

  namespace :admin do
    resources :memorials, except: [:index] do
      resources :guests
      get 'invite_new_with_email', to: 'guests#invite_new_with_email'
      post 'invite_new_with_email', to: 'guests#invite_create_with_email'
    end

  end

  match 'admin/memorials/:memorial_id/queue' => 'review#queue',
    :action => :queue, :via => :get

  match 'admin/memorials/:memorial_id/posts/:id/green_light' => 'review#green_light',
    :action => :green_light, :via => :put

  match 'admin/memorials/:memorial_id/posts/:id/red_light' => 'review#red_light',
    :action => :red_light, :via => :put

  match 'admin/memorials/:memorial_id/deleted_list' => 'review#deleted_list',
    :action => :deleted_list, :via => :get

  match 'admin/memorials/:memorial_id/deleted_list/post/:id' => 'review#callback',
    :action => :callback, :via => :put


  match 'auth/:provider/callback', to: 'facebook#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get 'auth/backdoor' if Rails.env.test?

  root "sessions#index"

  get 'admin_memorials', to: 'admin/memorials#show'
  get 'new_with_email', to: 'sessions#new_with_email'


end
