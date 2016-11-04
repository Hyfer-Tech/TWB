Rails.application.routes.draw do
  
  devise_for :business_users
  root 'static_pages#index'

  resources :users, only: :show
end
