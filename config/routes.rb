Rails.application.routes.draw do
  devise_for :admins

  root 'admin/dashboards#index'

  scope module: :admin, path: 'admin' do
    resources :users, only: %i[index show destroy]
    resources :movies, except: [:show]
  end

  namespace 'api' do
    resource :users, only: %i[], default: :json do
      get '/', to: 'users#show'
      post '/', to: 'users#create'
      # get '/:username', to: 'users#show'
      # post '/:username', to: 'users#create'
    end
  end
end
