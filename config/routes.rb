Rails.application.routes.draw do
  devise_for :admins
  root 'dashboards#index'

  scope module: :admin, path: 'admin' do
    resources :users
    resources :movies
  end
end
