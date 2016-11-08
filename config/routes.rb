Rails.application.routes.draw do


  devise_for :brokers

  devise_for :business_users

  root 'static_pages#index'


  get 'profile', to: :show, controller: 'users'

  resources :users, only: :show
end
