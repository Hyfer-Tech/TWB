Rails.application.routes.draw do


  devise_for :forward_freights
  devise_for :brokers

  devise_for :business_users

  authenticated :business_user do
    root 'business_users#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'profile', to: :show, controller: 'users'

  resources :users, only: :show

  resources :shipments, only: [:new, :create]
  resources :products, only: [:new, :create]
end
