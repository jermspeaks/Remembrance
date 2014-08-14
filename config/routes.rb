Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :memorials, only: [:index, :show]

  namespace :admin do
    resources :memorials, except: [:index]
  end

  root "sessions#new"
end
