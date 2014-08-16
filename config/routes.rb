Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  scope :memorials, :controller => 'memorials' do
    get :attended, :created
  end
  
  resources :memorials, only: [:index, :show]


  namespace :admin do
    resources :memorials, except: [:index]
  end

  resources :posts, except: [:index]
  resources :photos, except: [:index, :edit, :update]
  resources :comments, except: [:index]

  namespace :auth do
    match ':provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'failure', to: redirect('/'), via: [:get, :post]
    get 'backdoor' if Rails.env.test?
  end

	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root "sessions#new"
end
