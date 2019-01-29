Rails.application.routes.draw do
  devise_for :admins

  root 'admin/dashboards#index'

  scope module: :admin, path: 'admin' do
    resources :users, only: %i[index show destroy]
    resources :movies, except: [:show]
  end

  namespace 'api' do
    resource :users, only: %i[], default: :json do
      get '/getUser', to: 'users#show'
      post '/setUser', to: 'users#create'
    end

    resource :movies, only: %i[], default: :json do
      get '/getMovies', to: 'movies#index'
      get '/getMovieDetails', to: 'movies#show'
      get '/getFavoriteMovies', to: 'movies#favorites'
    end

    resource :likes, only: %i[], default: :json do
      post '/setFavorite', to: 'likes#create'
      delete '/setUnfavorite', to: 'likes#destroy'
    end
  end
end
