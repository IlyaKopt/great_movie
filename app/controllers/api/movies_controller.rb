class Api::MoviesController < ActionController::API
  include Response

  def index
    @movies = Movie.all
    json_response(@movies)
  end

  def favorites
    if movie_params[:username].present?
      user = User.find_by(movie_params)
      @movies = user.movies
      render json: @movies, status: 200
    else
      render json: { status: 401 }
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:username)
    end
end
