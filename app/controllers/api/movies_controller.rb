class Api::MoviesController < ActionController::API
  include Response

  def index
    movies = prepare_movies_json(Movie.all)
    json_response(movies)
  end

  def show
    if details_params[:id].present?
      movie = Movie.find_by(details_params)
      movie = prepare_details_json(movie)
      json_response(movie)
    else
      render json: { status: 500 }
    end
  end

  def favorites
    if movie_params[:username].present?
      user = User.find_by(movie_params)
      movies = prepare_movies_json(user.movies)
      render json: movies, status: 200
    else
      render json: { status: 401 }
    end
  end

  private

    def details_params
      params.require(:movie).permit(:id)
    end

    def movie_params
      params.require(:movie).permit(:username)
    end

    def prepare_movies_json(movies)
      movies.map do |movie|
        { id: movie.id, name: movie.name, thumbnail: "#{request.base_url}#{movie.thumbnail.url}" }
      end
    end

    def prepare_details_json(movie)
      {
        name: movie.name,
        genres: movie.genres,
        year: movie.year,
        director: movie.director,
        main_star: movie.main_star,
        description: movie.description,
        favorited: movie.favorited,
        thumbnail: "#{request.base_url}#{movie.thumbnail.url}"
      }
    end
end
