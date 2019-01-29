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

    resource :likes, only: %i[], default: :json do
      post '/favorite', to: 'likes#create'
      delete '/unfavorite', to: 'likes#destroy'
    end
  end
end
