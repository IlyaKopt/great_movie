Rails.application.routes.draw do
  devise_for :admins
  resources :users
  root 'dashboards#index'
end
