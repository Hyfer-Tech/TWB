Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :forward_freights, controllers: {registrations: 'registrations'}
  devise_for :brokers, controllers: {registrations: 'registrations'} 

  devise_for :business_users, controllers: {registrations: 'registrations'}

  authenticated :business_user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'dashboard',   to: 'dashboard#index'
  get 'search',   to: 'dashboard#search'
  get 'favorites',   to: 'dashboard#favorites'

  resources :taggings, only: :create
  resources :brokers, only: :show
  resources :forward_freights, only: :show
  resources :business_users, only: :show


  resources :users, only: [] do
    get 'profile', to: 'users#profile', on: :collection
    get 'saved', to: :saved, controller: 'users', on: :collection
  end

  post 'relationships', to: 'relationships#create'
  delete 'relationships', to: 'relationships#destroy'
end
