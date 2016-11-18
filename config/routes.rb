Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :forward_freights
  devise_for :brokers

  devise_for :business_users

  authenticated :business_user do
    root 'business_users#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'profile', to: :show, controller: 'users'
  get 'dashboard',   to: 'dashboard#index'

  resources :brokers, only: :show


  resources :users, only: :show
end
