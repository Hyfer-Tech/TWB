Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

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
  # get 'searches/:search',to: 'searches#index',as: :searches
  get 'brokers/search/',to: 'brokers#search'
  get 'forward_freights/search', to: 'forward_freights#search'


  # Jobs
  namespace :jobs do
    get '/search/',to: 'searches#index', as: :searches
  end  

  resources :jobs, only: [:index, :show] do
    resources :bids, only: [:new, :create, :index, :destroy]
  end

  # Audits
  resources :audits do
    resources :feedbacks
    resources :audit_requests, only: [:index, :create]
  end

  resources :audit_requests, only: [] do
    post 'approvals', to: 'audit_requests/approvals#create'
    post 'rejections', to: 'audit_requests/rejections#create'
  end

  resources :bids, only: :update do
    resources :bid_acceptances, only: :create
  end

  resources :shipments, only: [:index, :show, :new, :create] do
    resources :jobs, only: [:new, :create]
  end

  resources :products, only: [:new, :create, :show, :index, :edit, :update]

  resources :taggings, only: :create

  # Users
  resources :brokers, only: :show do
    get 'clients', to: "brokers#past_clients"
    post :chat_rooms, to: "broker_chat_rooms#create"
  end

  resources :forward_freights, only: :show do
    post :chat_rooms, to: "forward_freight_chat_rooms#create"
  end

  resources :business_users, only: :show do
    post :chat_rooms, to: "business_user_chat_rooms#create"
  end

  namespace :user do
    resources :jobs, only: :index
    resources :applications, only: :index
    resources :audits, only: :index    
  end

  resources :users, only: [] do
    get 'profile', to: :show, controller: 'users', on: :collection
    get 'saved', to: :saved, controller: 'users', on: :collection
  end

  post 'relationships', to: 'relationships#create'
  delete 'relationships', to: 'relationships#destroy'

  resources :uploads  

  # Chat
  resources :chat_rooms, only: [:index, :show]
  resources :chat_room_searches, only: :index

end
