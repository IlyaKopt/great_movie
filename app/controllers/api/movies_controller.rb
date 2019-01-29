class Api::MoviesController < ActionController::API
  include Response

  def index
    @movies = prepare_movies_json(Movie.all)
    json_response(@movies)
  end

  def favorites
    if movie_params[:username].present?
      user = User.find_by(movie_params)
      @movies = prepare_movies_json(user.movies)
      render json: @movies, status: 200
    else
      render json: { status: 401 }
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:username)
    end

    def prepare_movies_json(movies)
      movies.map do |movie|
        { id: movie.id, name: movie.name, thumbnail:"#{request.base_url}#{ movie.thumbnail.url}" }
      end
    end
end
