class Api::UsersController < ActionController::API
  include Response
  
  def show
    if params[:username].present?
      @user = User.find_by_username(params[:username])
      json_response(@user)
    else
      render json: {}, status: 401
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user)
    else
      render json: @user.errors, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end
end
