Rails.application.routes.draw do
  resources :users
  root 'dashboards#index'
end
