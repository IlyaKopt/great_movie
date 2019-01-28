Rails.application.routes.draw do
  devise_for :admins
  root 'dashboards#index'

  resources :users
  resources :movies
end
