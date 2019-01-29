Rails.application.routes.draw do
  devise_for :admins

  root 'admin/dashboards#index'

  scope module: :admin, path: 'admin' do
    resources :users, only: %i[index show destroy]
    resources :movies, except: [:show]
  end

  namespace 'api' do
    resources :users, only: %i[show new create], default: :json
  end
end
