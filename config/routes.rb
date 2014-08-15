Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :memorials, only: [:index, :show]

  scope :memorials, :controller => 'memorials' do
    get :attended, :created
  end

  namespace :admin do
    resources :memorials, except: [:index]
  end

  resources :posts, except: [:index]
  resources :photos, except: [:index, :edit, :update]
  resources :comments, except: [:index]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root "sessions#new"
end
