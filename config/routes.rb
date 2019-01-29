Rails.application.routes.draw do
  devise_for :admins

  root 'admin/dashboards#index'

  scope module: :admin, path: 'admin' do
    resources :users
    resources :movies, except: [:show]
  end
end
