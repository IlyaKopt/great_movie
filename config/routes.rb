Rails.application.routes.draw do
  resources :movies
  devise_for :admins
  root 'dashboards#index'

  resources :users
end
