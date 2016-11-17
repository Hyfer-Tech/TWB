Rails.application.routes.draw do


  devise_for :forward_freights
  devise_for :brokers

  devise_for :business_users

  authenticated :business_user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'dashboard',   to: 'dashboard#index'
  get 'search',   to: 'dashboard#search'
  get 'favorites',   to: 'dashboard#favorites'

  resources :users, only: :show

  resources :shipments, only: [:new, :create]
  resources :products, only: [:new, :create]

  resources :brokers, only: :show


  resources :users, only: :show do
    get 'profile', to: 'users#profile', on: :collection
    get 'saved', to: 'users#saved', on: :collection
  end

  post 'relationships', to: 'relationships#create'
  delete 'relationships', to: 'relationships#destroy'
end
