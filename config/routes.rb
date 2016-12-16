Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :forward_freights, controllers: {registrations: 'registrations', confirmations: 'confirmations'}
  devise_for :brokers, controllers: {registrations: 'registrations', confirmations: 'confirmations'}
  devise_for :business_users, controllers: {registrations: 'registrations', confirmations: 'confirmations'}

  authenticated :business_user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'static_pages#index'

  get 'dashboard',   to: 'dashboard#index'
  get 'search',   to: 'dashboard#search'
  get 'search/:tag', to: 'dashboard#search', as: :tag
  get 'favorites',   to: 'dashboard#favorites'
  get 'job_tag/:tag', to: 'jobs#index', as: :job_tag
  get 'searches/:search',to: 'searches#index',as: :searches

  namespace :user do
    resources :jobs, only: :index
    resources :applications, only: :index
  end

  resources :jobs, only: [:index, :show] do
    resources :bids, only: [:new, :create, :index, :destroy]  
  end


  resources :bids, only: :update do
    resources :bid_acceptances, only: :create
  end

  resources :shipments, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:new, :create]
  end

  resources :products, only: [:new, :create, :show]

  resources :taggings, only: :create
  resources :brokers, only: :show
  resources :forward_freights, only: :show
  resources :business_users, only: :show

  resources :uploads


  resources :users, only: [] do
    get 'profile', to: :show, controller: 'users', on: :collection
    get 'saved', to: :saved, controller: 'users', on: :collection
  end

  post 'relationships', to: 'relationships#create'
  delete 'relationships', to: 'relationships#destroy'

end
