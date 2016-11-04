Rails.application.routes.draw do
  
  devise_for :brokers
  root 'static_pages#index'

  resources :users, only: :show
end
