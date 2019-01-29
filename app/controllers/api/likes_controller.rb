class Api::LikesController < ActionController::API
  
  def create
    if like_params_present?
      like = set_user.favorites.build(movie_id: like_params[:movie_id])
      if like.save
        render json: like, status: 200
      else
        render json: like.errors, status: 422
      end
    else
      render json: { status: 401 }
    end
  end
  
  def destroy
    if like_params_present?
      like = set_user.favorites.where(movie_id: like_params[:movie_id]).first
      like.destroy
      render json: { status: 200 }
    else
      render json: { status: 401 }
    end
  end

  private   
    def like_params_present?
      like_params[:username].present? && like_params[:movie_id].present?
    end

    def set_user
      User.find_by_username(like_params[:username])
    end

    def like_params
      params.require(:like).permit(:username, :movie_id)
    end
end
