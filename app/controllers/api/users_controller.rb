class Api::UsersController < ActionController::API
  include Response
  
  def show
    if user_params[:username].present?
      user = User.find_by(user_params)
      if user.present?
        json_response(username: user.username)
      else
        render json: { error: 'Please create needed user' }, status: 401
      end
    else
      render json: { error: 'Please create needed user' }, status: 401
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      json_response(username: user.username)
    else
      render json: user.errors, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end
end
