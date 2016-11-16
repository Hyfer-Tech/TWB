Rails.application.routes.draw do


  devise_for :forward_freights
  devise_for :brokers

  devise_for :business_users

  authenticated :business_user do
    root 'business_users#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'dashboard',   to: 'dashboard#index'

  resources :brokers, only: :show


  resources :users, only: :show do
    get 'profile', to: :show, controller: 'users', on: :collection
    get 'saved', to: :saved, controller: 'users', on: :collection
  end

  post 'relationships', to: 'relationships#create'
  delete 'relationships', to: 'relationships#destroy'
end
