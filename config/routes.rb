Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :memorials, only: [:index, :show]

  namespace :admin do
    resources :memorials, except: [:index]
  end

  resources :posts, except: [:index]
  resources :photos, except: [:index, :edit, :update]
  resources :comments, except: [:index]

  root "sessions#new"
end
