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
    end

    resource :movies, only: %i[], default: :json do
      get '/', to: 'movies#index'
      get '/favorites', to: 'movies#favorites'
    end
  end
end
